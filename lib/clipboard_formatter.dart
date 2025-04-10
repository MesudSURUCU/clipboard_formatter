library clipboard_formatter;

/// A utility class for formatting various types of data for clipboard functionality.
class ClipboardFormatter {
  /// Formats a phone number string.
  ///
  /// By default, formats 10-digit numbers as '532 123 45 67'.
  /// If [customFormat] is provided, it will be used instead.
  static String formatPhoneNumber(String text, {String? customFormat}) {
    // Strip non-digit characters
    final digitsOnly = text.replaceAll(RegExp(r'[^\d]'), '');

    if (customFormat != null) {
      return _applyCustomFormat(digitsOnly, customFormat);
    }

    // Default format for 10-digit phone numbers
    if (digitsOnly.length == 10) {
      return '${digitsOnly.substring(0, 3)} '
          '${digitsOnly.substring(3, 6)} '
          '${digitsOnly.substring(6, 8)} '
          '${digitsOnly.substring(8)}';
    }

    // For 11-digit phone numbers (with country code)
    if (digitsOnly.length == 11) {
      return '${digitsOnly.substring(0, 1)} '
          '${digitsOnly.substring(1, 4)} '
          '${digitsOnly.substring(4, 7)} '
          '${digitsOnly.substring(7, 9)} '
          '${digitsOnly.substring(9)}';
    }

    // Return original text if not matching standard lengths
    return text;
  }

  /// Formats a Turkish phone number with the international code.
  ///
  /// Converts the input to the format: +90 532 123 45 67
  /// Works with both 10-digit (5321234567) and 11-digit numbers (05321234567).
  static String formatTurkishPhoneNumber(String text) {
    // Strip non-digit characters
    final digitsOnly = text.replaceAll(RegExp(r'[^\d]'), '');

    // Handle 10-digit numbers (without leading 0)
    if (digitsOnly.length == 10) {
      return '+90 ${digitsOnly.substring(0, 3)} '
          '${digitsOnly.substring(3, 6)} '
          '${digitsOnly.substring(6, 8)} '
          '${digitsOnly.substring(8)}';
    }

    // Handle 11-digit numbers (with leading 0)
    if (digitsOnly.length == 11 && digitsOnly.startsWith('0')) {
      return '+90 ${digitsOnly.substring(1, 4)} '
          '${digitsOnly.substring(4, 7)} '
          '${digitsOnly.substring(7, 9)} '
          '${digitsOnly.substring(9)}';
    }

    // Return original text if not matching Turkish phone format
    return text;
  }

  /// Formats an IBAN string with spaces after every 4 characters.
  static String formatIBAN(String text) {
    // Remove existing spaces
    final noSpaces = text.replaceAll(' ', '').toUpperCase();
    final regexp = RegExp('.{4}');
    return noSpaces
        .replaceAllMapped(regexp, (match) => '${match.group(0)} ')
        .trim();
  }

  /// Formats a Turkish IBAN by ensuring it starts with 'TR' and includes proper spacing.
  ///
  /// If the IBAN doesn't start with 'TR', it will be added.
  /// Example: formatTurkishIBAN('330006100519786457841326') -> 'TR33 0006 1005 1978 6457 8413 26'
  static String formatTurkishIBAN(String text) {
    // Remove existing spaces and convert to uppercase
    String noSpaces = text.replaceAll(' ', '').toUpperCase();

    // Remove TR prefix if it exists to avoid duplication
    if (noSpaces.startsWith('TR')) {
      noSpaces = noSpaces.substring(2);
    }

    // Add TR prefix
    noSpaces = 'TR$noSpaces';

    // Apply standard IBAN formatting
    final regexp = RegExp('.{4}');
    return noSpaces
        .replaceAllMapped(regexp, (match) => '${match.group(0)} ')
        .trim();
  }

  /// Formats a credit card number with spaces after every 4 digits.
  static String formatCreditCard(String text) {
    final digitsOnly = text.replaceAll(RegExp(r'[^\d]'), '');

    // Standard credit card length is 16, but some cards may be different
    if (digitsOnly.length < 13 || digitsOnly.length > 19) return text;

    final regexp = RegExp('.{4}');
    return digitsOnly
        .replaceAllMapped(regexp, (match) => '${match.group(0)} ')
        .trim();
  }

  /// Formats a date string according to specified pattern.
  ///
  /// Input should be in format 'YYYYMMDD' or 'DDMMYYYY' based on [isYearFirst].
  /// [separator] defines the character used between date components.
  /// [pattern] can be 'dmy', 'mdy', or 'ymd' to determine output format.
  static String formatDate(
    String text, {
    String separator = '/',
    String pattern = 'dmy',
    bool isYearFirst = false,
  }) {
    // Remove non-digit characters
    final digitsOnly = text.replaceAll(RegExp(r'[^\d]'), '');

    // Check for valid length
    if (digitsOnly.length != 8) return text;

    String day, month, year;

    if (isYearFirst) {
      // Format: YYYYMMDD
      year = digitsOnly.substring(0, 4);
      month = digitsOnly.substring(4, 6);
      day = digitsOnly.substring(6, 8);
    } else {
      // Format: DDMMYYYY
      day = digitsOnly.substring(0, 2);
      month = digitsOnly.substring(2, 4);
      year = digitsOnly.substring(4, 8);
    }

    // Validate date components
    int dayInt = int.tryParse(day) ?? 0;
    int monthInt = int.tryParse(month) ?? 0;
    int yearInt = int.tryParse(year) ?? 0;

    if (dayInt < 1 ||
        dayInt > 31 ||
        monthInt < 1 ||
        monthInt > 12 ||
        yearInt < 1000) {
      return text;
    }

    // Format according to pattern
    switch (pattern.toLowerCase()) {
      case 'dmy':
        return '$day$separator$month$separator$year';
      case 'mdy':
        return '$month$separator$day$separator$year';
      case 'ymd':
        return '$year$separator$month$separator$day';
      default:
        return '$day$separator$month$separator$year';
    }
  }

  /// Formats a numeric amount as currency.
  ///
  /// [currencySymbol] specifies the currency symbol to use (default: '₺').
  /// [decimalSeparator] defines the character used for decimal separation (default: ',').
  /// [thousandsSeparator] defines the character for thousands grouping (default: '.').
  static String formatCurrency(
    String text, {
    String currencySymbol = '₺',
    String decimalSeparator = ',',
    String thousandsSeparator = '.',
    int decimalPlaces = 2,
    bool symbolAtEnd = false,
  }) {
    // Remove all non-digit and non-decimal characters
    String cleanText = text.replaceAll(RegExp(r'[^\d.,]'), '');

    // Normalize the decimal separator to '.'
    if (decimalSeparator != '.') {
      cleanText = cleanText.replaceAll(decimalSeparator, '.');
    }

    // Handle multiple decimal points by keeping only the first one
    final parts = cleanText.split('.');
    if (parts.length > 2) {
      cleanText = parts[0] + '.' + parts.sublist(1).join('');
    }

    // Parse to double and format
    double? value = double.tryParse(cleanText);
    if (value == null) return text;

    // Split into whole and decimal parts
    final wholePartStr = value.floor().toString();
    String decimalPartStr = '';

    if (decimalPlaces > 0) {
      final valueStr = value.toStringAsFixed(decimalPlaces);
      decimalPartStr = valueStr.substring(valueStr.indexOf('.') + 1);
    }

    // Format whole part with thousands separators
    final result = <String>[];
    for (int i = wholePartStr.length; i > 0; i -= 3) {
      final start = i - 3 < 0 ? 0 : i - 3;
      result.insert(0, wholePartStr.substring(start, i));
    }

    String formattedAmount = result.join(thousandsSeparator);

    // Add decimal part if needed
    if (decimalPlaces > 0) {
      formattedAmount += decimalSeparator + decimalPartStr;
    }

    // Add currency symbol
    return symbolAtEnd
        ? '$formattedAmount $currencySymbol'
        : '$currencySymbol $formattedAmount';
  }

  // Helper method to apply custom format patterns
  static String _applyCustomFormat(String digits, String format) {
    int digitIndex = 0;
    final result = StringBuffer();

    for (int i = 0; i < format.length; i++) {
      if (format[i] == '#') {
        if (digitIndex < digits.length) {
          result.write(digits[digitIndex]);
          digitIndex++;
        }
      } else {
        result.write(format[i]);
      }
    }

    return result.toString();
  }
}
