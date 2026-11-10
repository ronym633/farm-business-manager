import 'package:flutter/services.dart';

import '../../database/app_database.dart';
import 'society_sms_processing_service.dart';

class SocietySmsBridge {
  static const MethodChannel _channel = MethodChannel(
    'farm_business_manager/sms',
  );

  static Future<bool> hasPermission() async {
    return await _channel.invokeMethod<bool>('hasSmsPermission') ?? false;
  }

  static Future<bool> requestPermission() async {
    return await _channel.invokeMethod<bool>('requestSmsPermission') ?? false;
  }

  // Send active society sender IDs to the Android SMS receiver.
  static Future<void> updateAllowedSenders(AppDatabase database) async {
    final rows = await database.select(database.societySenders).get();

    final senders = rows
        .where((row) => row.isActive)
        .map((row) => row.senderIdentifier)
        .toList();

    await _channel.invokeMethod<bool>('setAllowedSenders', {
      'senders': senders,
    });
  }

  static Future<int> importPendingMessages(AppDatabase database) async {
    final pending = await _channel.invokeListMethod<dynamic>('getPendingSms');

    if (pending == null || pending.isEmpty) return 0;

    final service = SocietySmsProcessingService(database);
    final senderRows = await database.select(database.societySenders).get();

    final allowedSenders = senderRows
        .where((row) => row.isActive)
        .map((row) => row.senderIdentifier.toUpperCase().trim())
        .toSet();
    final importedIds = <String>[];

    for (final item in pending) {
      final sms = Map<String, dynamic>.from(item as Map);

      final id = sms['id'] as String;
      final sender = (sms['sender'] as String).toUpperCase().trim();

      if (!allowedSenders.any((allowed) => sender.endsWith(allowed))) {
        importedIds.add(id);
        continue;
      }
      await service.saveIncomingSms(
        sender: sms['sender'] as String,
        messageBody: sms['body'] as String,
        receivedAt: DateTime.fromMillisecondsSinceEpoch(
          sms['receivedAt'] as int,
        ),
        sourceDeviceId: sms['deviceId'] as String,
      );

      importedIds.add(id);
    }

    await _channel.invokeMethod<bool>('acknowledgePendingSms', {
      'ids': importedIds,
    });

    return importedIds.length;
  }
}
