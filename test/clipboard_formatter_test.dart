import 'package:flutter_test/flutter_test.dart';
import 'package:clipboard_formatter/clipboard_formatter.dart';

void main() {
  group('ClipboardFormatter', () {
    group('Phone Number Formatting', () {
      test('formats 10-digit phone number correctly', () {
        expect(
          ClipboardFormatter.formatPhoneNumber('5321234567'),
          '532 123 45 67',
        );
      });

      test('formats 11-digit phone number correctly', () {
        expect(
          ClipboardFormatter.formatPhoneNumber('05321234567'),
          '0 532 123 45 67',
        );
      });

      test('handles non-digit characters', () {
        expect(
          ClipboardFormatter.formatPhoneNumber('(532) 123-4567'),
          '532 123 45 67',
        );
      });

      test('supports custom format', () {
        expect(
          ClipboardFormatter.formatPhoneNumber(
            '5321234567',
            customFormat: '(###) ###-####',
          ),
          '(532) 123-4567',
        );
      });

      test('formats Turkish phone number with 10 digits', () {
        expect(
          ClipboardFormatter.formatTurkishPhoneNumber('5321234567'),
          '+90 532 123 45 67',
        );
      });

      test('formats Turkish phone number with 11 digits', () {
        expect(
          ClipboardFormatter.formatTurkishPhoneNumber('05321234567'),
          '+90 532 123 45 67',
        );
      });

      test('handles non-digit characters in Turkish phone number', () {
        expect(
          ClipboardFormatter.formatTurkishPhoneNumber('(0532) 123-4567'),
          '+90 532 123 45 67',
        );
      });
    });

    group('IBAN Formatting', () {
      test('formats IBAN correctly', () {
        expect(
          ClipboardFormatter.formatIBAN('TR330006100519786457841326'),
          'TR33 0006 1005 1978 6457 8413 26',
        );
      });

      test('removes existing spaces', () {
        expect(
          ClipboardFormatter.formatIBAN('TR33 0006 1005 1978 6457 8413 26'),
          'TR33 0006 1005 1978 6457 8413 26',
        );
      });

      test('converts to uppercase', () {
        expect(
          ClipboardFormatter.formatIBAN('tr330006100519786457841326'),
          'TR33 0006 1005 1978 6457 8413 26',
        );
      });

      test('formats Turkish IBAN by adding TR prefix', () {
        expect(
          ClipboardFormatter.formatTurkishIBAN('330006100519786457841326'),
          'TR33 0006 1005 1978 6457 8413 26',
        );
      });

      test('handles existing TR prefix in Turkish IBAN', () {
        expect(
          ClipboardFormatter.formatTurkishIBAN('TR330006100519786457841326'),
          'TR33 0006 1005 1978 6457 8413 26',
        );
      });

      test('handles lowercase tr prefix in Turkish IBAN', () {
        expect(
          ClipboardFormatter.formatTurkishIBAN('tr330006100519786457841326'),
          'TR33 0006 1005 1978 6457 8413 26',
        );
      });
    });

    group('Credit Card Formatting', () {
      test('formats 16-digit credit card correctly', () {
        expect(
          ClipboardFormatter.formatCreditCard('1234567890123456'),
          '1234 5678 9012 3456',
        );
      });

      test('handles non-digit characters', () {
        expect(
          ClipboardFormatter.formatCreditCard('1234-5678-9012-3456'),
          '1234 5678 9012 3456',
        );
      });

      test('works with different length cards', () {
        expect(
          ClipboardFormatter.formatCreditCard('123456789012345678'),
          '1234 5678 9012 3456 78',
        );
      });
    });

    group('Date Formatting', () {
      test('formats date in DMY pattern', () {
        expect(
          ClipboardFormatter.formatDate('01022023', pattern: 'dmy'),
          '01/02/2023',
        );
      });

      test('formats date in MDY pattern', () {
        expect(
          ClipboardFormatter.formatDate('01022023', pattern: 'mdy'),
          '01/02/2023',
        );
      });

      test('formats date in YMD pattern', () {
        expect(
          ClipboardFormatter.formatDate('01022023', pattern: 'ymd'),
          '2023/01/02',
        );
      });

      test('uses custom separators', () {
        expect(
          ClipboardFormatter.formatDate('01022023', separator: '-'),
          '01-02-2023',
        );
      });

      test('handles year-first input', () {
        expect(
          ClipboardFormatter.formatDate(
            '20230102',
            pattern: 'dmy',
            isYearFirst: true,
          ),
          '02/01/2023',
        );
      });
    });

    group('Currency Formatting', () {
      test('formats currency with default settings', () {
        expect(
          ClipboardFormatter.formatCurrency('1234.56'),
          '₺ 1.234,56',
        );
      });

      test('handles whole numbers', () {
        expect(
          ClipboardFormatter.formatCurrency('1234'),
          '₺ 1.234,00',
        );
      });

      test('uses custom currency symbol', () {
        expect(
          ClipboardFormatter.formatCurrency('1234.56', currencySymbol: '€'),
          '€ 1.234,56',
        );
      });

      test('places symbol at end when specified', () {
        expect(
          ClipboardFormatter.formatCurrency(
            '1234.56',
            symbolAtEnd: true,
          ),
          '1.234,56 ₺',
        );
      });

      test('uses custom decimal places', () {
        expect(
          ClipboardFormatter.formatCurrency(
            '1234.56789',
            decimalPlaces: 3,
          ),
          '₺ 1.234,568',
        );
      });

      test('uses custom separators', () {
        expect(
          ClipboardFormatter.formatCurrency(
            '1234.56',
            decimalSeparator: '.',
            thousandsSeparator: ',',
          ),
          '₺ 1,234.56',
        );
      });
    });
  });
}
