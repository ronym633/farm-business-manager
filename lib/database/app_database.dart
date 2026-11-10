import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class BusinessGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Businesses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get businessType => text()();
  IntColumn get groupId =>
      integer().nullable().references(BusinessGroups, #id)();
  TextColumn get location => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Partners extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class BusinessPartners extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get businessId => integer().references(Businesses, #id)();
  IntColumn get partnerId => integer().references(Partners, #id)();
  RealColumn get sharePercentage => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class FinancialTransactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get businessId => integer().references(Businesses, #id)();
  TextColumn get transactionType => text()();
  TextColumn get category => text()();
  RealColumn get amount => real()();
  DateTimeColumn get transactionDate => dateTime()();
  TextColumn get description => text().nullable()();
  BoolColumn get isReversed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get reversedAt => dateTime().nullable()();
  TextColumn get reversalReason => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class TransactionAuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionId => integer()();
  TextColumn get action => text()();
  TextColumn get details => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Milk societies
class MilkSocieties extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get businessId => integer().references(Businesses, #id)();
  TextColumn get name => text().withLength(min: 1, max: 150)();
  TextColumn get location => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Society sender IDs / mobile numbers
class SocietySenders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get societyId => integer().references(MilkSocieties, #id)();
  TextColumn get senderIdentifier => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Producer registration
class MilkProducers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get societyId => integer().references(MilkSocieties, #id)();
  TextColumn get producerNumber => text()();
  TextColumn get producerName => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Partner phones registered with the application
class RegisteredDevices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get deviceId => text().unique()();
  IntColumn get partnerId => integer().nullable().references(Partners, #id)();
  TextColumn get deviceName => text()();
  TextColumn get platform => text()();
  DateTimeColumn get lastSeenAt => dateTime().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// Original SMS messages and processing status
class SocietySmsMessages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get societyId =>
      integer().nullable().references(MilkSocieties, #id)();
  IntColumn get producerId =>
      integer().nullable().references(MilkProducers, #id)();

  TextColumn get sender => text()();
  TextColumn get messageBody => text()();
  DateTimeColumn get receivedAt => dateTime()();
  TextColumn get sourceDeviceId => text().nullable()();

  // Unique fingerprint prevents duplicate imports on the same database.
  TextColumn get messageFingerprint => text().unique()();

  // Values: pending, processed, review, failed
  TextColumn get processingStatus =>
      text().withDefault(const Constant('pending'))();

  // Values: milk_bill, feed_bill, bank_payment, unknown
  TextColumn get detectedType => text().nullable()();

  TextColumn get processingError => text().nullable()();
  DateTimeColumn get processedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@TableIndex(
  name: 'idx_society_sms_accounting_message',
  columns: {#smsMessageId},
  unique: true,
)
class SocietySmsAccountingEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get smsMessageId => integer().references(SocietySmsMessages, #id)();

  IntColumn get financialTransactionId =>
      integer().nullable().references(FinancialTransactions, #id)();

  // milk_income, feed_expense, bank_settlement
  TextColumn get entryType => text()();

  RealColumn get amount => real()();

  DateTimeColumn get transactionDate => dateTime()();

  TextColumn get bankName => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(
  tables: [
    BusinessGroups,
    Businesses,
    Partners,
    BusinessPartners,
    FinancialTransactions,
    TransactionAuditLogs,
    MilkSocieties,
    SocietySenders,
    MilkProducers,
    RegisteredDevices,
    SocietySmsMessages,
    SocietySmsAccountingEntries,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
    : super(
        driftDatabase(
          name: 'farm_business_manager',
          web: DriftWebOptions(
            sqlite3Wasm: Uri.parse('sqlite3.wasm'),
            driftWorker: Uri.parse('drift_worker.js'),
          ),
        ),
      );

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(partners);
        await m.createTable(businessPartners);
      }

      if (from < 3) {
        await m.createTable(financialTransactions);
        await m.createTable(transactionAuditLogs);
      }

      if (from < 4) {
        await m.createTable(milkSocieties);
        await m.createTable(societySenders);
        await m.createTable(milkProducers);
        await m.createTable(registeredDevices);
        await m.createTable(societySmsMessages);
      }
      if (from < 5) {
        await m.createTable(societySmsAccountingEntries);
      }
    },
  );
}
