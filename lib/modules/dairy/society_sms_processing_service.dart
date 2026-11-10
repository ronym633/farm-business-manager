import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';

import 'dart:convert';

import '../../database/app_database.dart';
import 'society_sms_parser.dart';

class SocietySmsProcessingService {
  final AppDatabase database;

  SocietySmsProcessingService(this.database);

  /// Creates a consistent fingerprint for duplicate detection.
  String createFingerprint({
    required String sender,
    required String messageBody,
    required DateTime receivedAt,
  }) {
    final normalized = [
      sender.trim().toUpperCase(),
      messageBody.replaceAll('\r', '').trim().replaceAll(RegExp(r'\s+'), ' '),
      receivedAt.year,
      receivedAt.month,
      receivedAt.day,
    ].join('|');

    return sha256.convert(utf8.encode(normalized)).toString();
  }

  /// Saves an incoming SMS locally. Duplicate messages are ignored.
  Future<int?> saveIncomingSms({
    required String sender,
    required String messageBody,
    required DateTime receivedAt,
    String? sourceDeviceId,
  }) async {
    final fingerprint = createFingerprint(
      sender: sender,
      messageBody: messageBody,
      receivedAt: receivedAt,
    );

    final existing =
        await (database.select(database.societySmsMessages)
              ..where((table) => table.messageFingerprint.equals(fingerprint)))
            .getSingleOrNull();

    if (existing != null) return null;

    return database
        .into(database.societySmsMessages)
        .insert(
          SocietySmsMessagesCompanion.insert(
            sender: sender,
            messageBody: messageBody,
            receivedAt: receivedAt,
            sourceDeviceId: Value(sourceDeviceId),
            messageFingerprint: fingerprint,
          ),
        );
  }

  /// Processes all pending SMS messages.
  Future<void> processPendingMessages() async {
    final messages =
        await (database.select(database.societySmsMessages)
              ..where((table) => table.processingStatus.equals('pending'))
              ..orderBy([(table) => OrderingTerm.asc(table.receivedAt)]))
            .get();

    for (final message in messages) {
      await processMessage(message.id);
    }
  }

  /// Processes one SMS message.
  Future<void> processMessage(int messageId) async {
    final message = await (database.select(
      database.societySmsMessages,
    )..where((table) => table.id.equals(messageId))).getSingleOrNull();

    if (message == null) return;

    try {
      final parsed = SocietySmsParser.parse(message.messageBody);

      if (parsed.type == SocietySmsType.unknown ||
          parsed.needsReview ||
          parsed.date == null) {
        await _markForReview(
          message.id,
          parsed.warnings.isEmpty
              ? 'Message format not recognised'
              : parsed.warnings.join(', '),
          parsed.type.name,
        );
        return;
      }

      // Match the sender to a registered society.
      final senderRecords =
          await (database.select(database.societySenders)..where(
                (table) =>
                    table.senderIdentifier.equals(message.sender) &
                    table.isActive.equals(true),
              ))
              .get();

      if (senderRecords.isEmpty) {
        await _markForReview(
          message.id,
          'Sender is not registered with any active society',
          parsed.type.name,
        );
        return;
      }

      final societyIds = senderRecords.map((item) => item.societyId).toSet();

      if (societyIds.length != 1) {
        await _markForReview(
          message.id,
          'Sender matches more than one society',
          parsed.type.name,
        );
        return;
      }

      final societyId = societyIds.first;

      // Match the producer number to the selected society.
      final producerRecords =
          await (database.select(database.milkProducers)..where(
                (table) =>
                    table.societyId.equals(societyId) &
                    table.producerNumber.equals(parsed.producerNumber!) &
                    table.isActive.equals(true),
              ))
              .get();

      if (producerRecords.length != 1) {
        await _markForReview(
          message.id,
          'Producer is not registered or has duplicate registrations',
          parsed.type.name,
        );
        return;
      }

      final society = await (database.select(
        database.milkSocieties,
      )..where((table) => table.id.equals(societyId))).getSingleOrNull();

      if (society == null || !society.isActive) {
        await _markForReview(
          message.id,
          'Society is inactive or unavailable',
          parsed.type.name,
        );
        return;
      }

      final producer = producerRecords.first;

      await database.transaction(() async {
        // Do not create accounting entries twice.
        final existingEntry =
            await (database.select(database.societySmsAccountingEntries)
                  ..where((table) => table.smsMessageId.equals(message.id)))
                .getSingleOrNull();

        if (existingEntry != null) return;

        final entryType = _entryType(parsed.type);
        final amount = _amount(parsed);

        if (amount == null || amount <= 0) {
          throw Exception('Invalid or zero transaction amount');
        }

        int? financialTransactionId;

        // Bank payment is a settlement, not new income.
        if (parsed.type == SocietySmsType.milkBill ||
            parsed.type == SocietySmsType.feedBill) {
          final transactionType = parsed.type == SocietySmsType.milkBill
              ? 'income'
              : 'expense';

          final category = parsed.type == SocietySmsType.milkBill
              ? 'Milk Sales'
              : 'Cattle Feed';

          final description =
              'Society: ${society.name}; '
              'Producer: ${producer.producerNumber} - ${producer.producerName}; '
              'SMS ID: ${message.id}';

          financialTransactionId = await database
              .into(database.financialTransactions)
              .insert(
                FinancialTransactionsCompanion.insert(
                  businessId: society.businessId,
                  transactionType: transactionType,
                  category: category,
                  amount: amount,
                  transactionDate: parsed.date!,
                  description: Value(description),
                ),
              );

          await database
              .into(database.transactionAuditLogs)
              .insert(
                TransactionAuditLogsCompanion.insert(
                  transactionId: financialTransactionId,
                  action: 'created_from_society_sms',
                  details: Value('${parsed.type.name}; SMS ID: ${message.id}'),
                ),
              );
        }

        await database
            .into(database.societySmsAccountingEntries)
            .insert(
              SocietySmsAccountingEntriesCompanion.insert(
                smsMessageId: message.id,
                financialTransactionId: Value(financialTransactionId),
                entryType: entryType,
                amount: amount,
                transactionDate: parsed.date!,
                bankName: Value(parsed.bankName),
              ),
            );

        await (database.update(
          database.societySmsMessages,
        )..where((table) => table.id.equals(message.id))).write(
          SocietySmsMessagesCompanion(
            societyId: Value(societyId),
            producerId: Value(producer.id),
            detectedType: Value(parsed.type.name),
            processingStatus: const Value('processed'),
            processingError: const Value(null),
            processedAt: Value(DateTime.now()),
          ),
        );
      });
    } catch (error) {
      await _markForReview(message.id, error.toString(), null);
    }
  }

  String _entryType(SocietySmsType type) {
    switch (type) {
      case SocietySmsType.milkBill:
        return 'milk_income';
      case SocietySmsType.feedBill:
        return 'feed_expense';
      case SocietySmsType.bankPayment:
        return 'bank_settlement';
      case SocietySmsType.unknown:
        return 'unknown';
    }
  }

  double? _amount(ParsedSocietyMessage parsed) {
    switch (parsed.type) {
      case SocietySmsType.milkBill:
        return parsed.milkTotal;
      case SocietySmsType.feedBill:
        return parsed.feedRate;
      case SocietySmsType.bankPayment:
        return parsed.bankAmount;
      case SocietySmsType.unknown:
        return null;
    }
  }

  Future<void> _markForReview(
    int messageId,
    String reason,
    String? detectedType,
  ) async {
    await (database.update(
      database.societySmsMessages,
    )..where((table) => table.id.equals(messageId))).write(
      SocietySmsMessagesCompanion(
        processingStatus: const Value('review'),
        processingError: Value(reason),
        detectedType: Value(detectedType),
      ),
    );
  }
}
