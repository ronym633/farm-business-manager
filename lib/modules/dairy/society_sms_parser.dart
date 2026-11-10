enum SocietySmsType { milkBill, feedBill, bankPayment, unknown }

class MilkPeriodReading {
  final double? quantity;
  final double? fat;
  final double? snf;
  final double? rate;

  const MilkPeriodReading({this.quantity, this.fat, this.snf, this.rate});
}

class ParsedSocietyMessage {
  final SocietySmsType type;
  final DateTime? date;
  final String? producerNumber;
  final String? producerName;
  final String? societyName;

  final MilkPeriodReading? morning;
  final MilkPeriodReading? evening;
  final double? milkTotal;

  final String? feedItem;
  final double? feedQuantity;
  final String? feedUnit;
  final double? feedRate;
  final double? feedSubtotal;
  final double? feedCash;
  final double? feedBalance;

  final double? bankAmount;
  final String? bankName;

  final List<String> warnings;

  const ParsedSocietyMessage({
    required this.type,
    this.date,
    this.producerNumber,
    this.producerName,
    this.societyName,
    this.morning,
    this.evening,
    this.milkTotal,
    this.feedItem,
    this.feedQuantity,
    this.feedUnit,
    this.feedRate,
    this.feedSubtotal,
    this.feedCash,
    this.feedBalance,
    this.bankAmount,
    this.bankName,
    this.warnings = const [],
  });

  bool get needsReview => warnings.isNotEmpty;
}

class SocietySmsParser {
  static ParsedSocietyMessage parse(String message) {
    final body = message.replaceAll('\r', '').trim();
    final upper = body.toUpperCase();

    SocietySmsType type;

    if (upper.contains('[MILK BILL]')) {
      type = SocietySmsType.milkBill;
    } else if (upper.contains('[FEED/SALES]')) {
      type = SocietySmsType.feedBill;
    } else if (upper.contains('[BANK PAYMENT]')) {
      type = SocietySmsType.bankPayment;
    } else {
      return const ParsedSocietyMessage(
        type: SocietySmsType.unknown,
        warnings: ['Unrecognised society SMS format'],
      );
    }

    final date = _extractDate(body);
    final producer = _extractProducer(body);
    final society = _extractSocietyName(body);

    final warnings = <String>[];

    if (date == null) warnings.add('Date not recognised');
    if (producer.number == null) {
      warnings.add('Producer number not found');
    }

    if (type == SocietySmsType.milkBill) {
      final amBlock = _extractBlock(body, 'AM', ['PM', 'Tot']);

      final pmBlock = _extractBlock(body, 'PM', ['Tot']);

      final am = _extractMilkPeriod(amBlock);
      final pm = _extractMilkPeriod(pmBlock);
      final total = _extractNumber(body, r'Tot\s*:');

      if (am.quantity == null) warnings.add('AM quantity missing');
      if (pm.quantity == null) warnings.add('PM quantity missing');
      if (total == null) warnings.add('Milk bill total missing');

      return ParsedSocietyMessage(
        type: type,
        date: date,
        producerNumber: producer.number,
        producerName: producer.name,
        societyName: society,
        morning: am,
        evening: pm,
        milkTotal: total,
        warnings: warnings,
      );
    }

    if (type == SocietySmsType.feedBill) {
      final item = _extractText(body, r'ITEM\s*:');
      final unitMatch = RegExp(
        r'^\s*UNIT\s*:\s*([\d,]+(?:\.\d+)?)\s*(.*)$',
        multiLine: true,
        caseSensitive: false,
      ).firstMatch(body);

      final quantity = unitMatch == null ? null : _number(unitMatch.group(1));

      final unit = unitMatch?.group(2)?.trim();

      final rate = _extractNumber(body, r'RATE\s*:');
      final subtotal = _extractNumber(body, r'SUB\s*:');
      final cash = _extractNumber(body, r'CASH\s*:');
      final balance = _extractNumber(body, r'BAL\s*:');

      if (item == null) warnings.add('Feed item missing');
      if (quantity == null) warnings.add('Feed quantity missing');
      if (rate == null) warnings.add('Feed amount missing');

      return ParsedSocietyMessage(
        type: type,
        date: date,
        producerNumber: producer.number,
        producerName: producer.name,
        societyName: society,
        feedItem: item,
        feedQuantity: quantity,
        feedUnit: unit,
        feedRate: rate,
        feedSubtotal: subtotal,
        feedCash: cash,
        feedBalance: balance,
        warnings: warnings,
      );
    }

    final amount = _extractNumber(body, r'Rs\s*:');
    final bank = _extractText(body, r'Bank\s*:');

    if (amount == null) warnings.add('Bank payment amount missing');
    if (bank == null) warnings.add('Bank name missing');

    return ParsedSocietyMessage(
      type: type,
      date: date,
      producerNumber: producer.number,
      producerName: producer.name,
      societyName: society,
      bankAmount: amount,
      bankName: bank,
      warnings: warnings,
    );
  }

  static DateTime? _extractDate(String body) {
    final match = RegExp(
      r'Dt\s*:\s*(\d{1,2})/(\d{1,2})/(\d{4})',
      caseSensitive: false,
    ).firstMatch(body);

    if (match == null) return null;

    try {
      return DateTime(
        int.parse(match.group(3)!),
        int.parse(match.group(2)!),
        int.parse(match.group(1)!),
      );
    } catch (_) {
      return null;
    }
  }

  static ({String? number, String? name}) _extractProducer(String body) {
    final match = RegExp(
      r'Pro\s*#\s*(\d+)\s*-\s*(.+)',
      caseSensitive: false,
      multiLine: true,
    ).firstMatch(body);

    return (number: match?.group(1)?.trim(), name: match?.group(2)?.trim());
  }

  static String? _extractSocietyName(String body) {
    final lines = body
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    if (lines.length < 2) return null;

    final last = lines.last;

    if (last.startsWith('[')) return null;

    return last;
  }

  static String _extractBlock(String body, String start, List<String> endings) {
    final endPattern = endings.map(RegExp.escape).join('|');

    final match = RegExp(
      '$start\\s*>?([\\s\\S]*?)(?=$endPattern\\s*>?|\\Z)',
      caseSensitive: false,
    ).firstMatch(body);

    return match?.group(1) ?? '';
  }

  static MilkPeriodReading _extractMilkPeriod(String block) {
    return MilkPeriodReading(
      quantity: _extractNumber(block, r'Q\s*:'),
      fat: _extractNumber(block, r'F\s*:'),
      snf: _extractNumber(block, r'S\s*:'),
      rate: _extractNumber(block, r'Rs\s*:'),
    );
  }

  static double? _extractNumber(String body, String label) {
    final match = RegExp(
      '$label\\s*([\\d,]+(?:\\.\\d+)?)',
      caseSensitive: false,
    ).firstMatch(body);

    return _number(match?.group(1));
  }

  static double? _number(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return double.tryParse(value.replaceAll(',', '').trim());
  }

  static String? _extractText(String body, String label) {
    final match = RegExp(
      '^\\s*$label\\s*(.+?)\\s*\$',
      caseSensitive: false,
      multiLine: true,
    ).firstMatch(body);

    return match?.group(1)?.trim();
  }
}
