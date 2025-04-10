// EN // 

Clipboard Formatter
A Flutter package for formatting various types of text data for clipboard operations. The package provides formatting for:

Phone numbers
Credit card numbers
IBAN numbers
Dates
Currency amounts
Features
Phone Number Formatting: Convert raw numbers into readable formats (e.g., 5321234567 → 532 123 45 67)
Turkish Phone Number Formatting: Automatically add Turkey's country code (e.g., 5321234567 → +90 532 123 45 67)
Credit Card Formatting: Add spaces for better readability (e.g., 1234567890123456 → 1234 5678 9012 3456)
IBAN Formatting: Group IBAN numbers into standard 4-character blocks
Turkish IBAN Formatting: Automatically add TR prefix for Turkish IBANs
Date Formatting: Format dates with various patterns (DMY, MDY, YMD) and separators
Currency Formatting: Format monetary values with the proper currency symbol, decimal and thousands separators
Getting Started
Add the package to your pubspec.yaml:

yaml
dependencies:
  clipboard_formatter: ^0.1.0
Usage
Import the package:

dart
import 'package:clipboard_formatter/clipboard_formatter.dart';
Phone Number Formatting
dart
// Basic usage
String formatted = ClipboardFormatter.formatPhoneNumber('5321234567');
// Result: '532 123 45 67'

// With custom format
String customFormatted = ClipboardFormatter.formatPhoneNumber(
  '5321234567',
  customFormat: '(###) ###-####',
);
// Result: '(532) 123-4567'

// Turkish phone number format (with country code)
String turkishFormatted = ClipboardFormatter.formatTurkishPhoneNumber('5321234567');
// Result: '+90 532 123 45 67'

// Works with or without leading zero
String turkishFormatted2 = ClipboardFormatter.formatTurkishPhoneNumber('05321234567');
// Result: '+90 532 123 45 67'
Credit Card Formatting
dart
String formatted = ClipboardFormatter.formatCreditCard('1234567890123456');
// Result: '1234 5678 9012 3456'
IBAN Formatting
dart
String formatted = ClipboardFormatter.formatIBAN('TR330006100519786457841326');
// Result: 'TR33 0006 1005 1978 6457 8413 26'

// Turkish IBAN formatting (auto-adds TR prefix)
String turkishFormatted = ClipboardFormatter.formatTurkishIBAN('330006100519786457841326');
// Result: 'TR33 0006 1005 1978 6457 8413 26'

// Works even if TR is already present
String turkishFormatted2 = ClipboardFormatter.formatTurkishIBAN('TR330006100519786457841326');
// Result: 'TR33 0006 1005 1978 6457 8413 26'
Date Formatting
dart
// Default formatting (DMY with / separator)
String formatted = ClipboardFormatter.formatDate('01022023');
// Result: '01/02/2023'

// Custom pattern and separator
String customFormatted = ClipboardFormatter.formatDate(
  '01022023',
  pattern: 'ymd',
  separator: '-',
);
// Result: '2023-01-02'

// Handle year-first input
String yearFirstFormatted = ClipboardFormatter.formatDate(
  '20230102',
  isYearFirst: true,
);
// Result: '02/01/2023'
Currency Formatting
dart
// Default formatting (Turkish Lira)
String formatted = ClipboardFormatter.formatCurrency('1234.56');
// Result: '₺ 1.234,56'

// Custom formatting
String customFormatted = ClipboardFormatter.formatCurrency(
  '1234.56',
  currencySymbol: '€',
  decimalSeparator: '.',
  thousandsSeparator: ',',
  symbolAtEnd: true,
);
// Result: '1,234.56 €'
Example
dart
TextField(
  onChanged: (value) {
    setState(() {
      _formattedText = ClipboardFormatter.formatPhoneNumber(value);
    });
  },
  decoration: const InputDecoration(
    labelText: 'Enter phone number',
  ),
),
Text('Formatted: $_formattedText'),
License
This project is licensed under the MIT License - see the LICENSE file for details.

// TR // 

Clipboard Formatter

Clipboard işlemleri için çeşitli metin verilerini biçimlendirmeye yarayan bir Flutter paketi. Bu paket aşağıdaki veriler için biçimlendirme sağlar:
	•	Telefon numaraları
	•	Kredi kartı numaraları
	•	IBAN numaraları
	•	Tarihler
	•	Para birimi tutarları

Özellikler
	•	Telefon Numarası Biçimlendirme: Ham numaraları okunabilir formatlara çevirir
(örnek: 5321234567 → 532 123 45 67)
	•	Türk Telefon Numarası Biçimlendirme: Türkiye’nin ülke kodunu otomatik olarak ekler
(örnek: 5321234567 → +90 532 123 45 67)
	•	Kredi Kartı Biçimlendirme: Okunabilirlik için aralara boşluk ekler
(örnek: 1234567890123456 → 1234 5678 9012 3456)
	•	IBAN Biçimlendirme: IBAN numaralarını standart 4 karakterlik bloklara ayırır
	•	Türk IBAN Biçimlendirme: Türk IBAN’ları için TR ön ekini otomatik olarak ekler
	•	Tarih Biçimlendirme: Farklı desen ve ayraçlarla tarih biçimlendirmesi yapar
(DMY, MDY, YMD)
	•	Para Birimi Biçimlendirme: Para değerlerini uygun simge, ondalık ve binlik ayırıcılarla biçimlendirir

⸻

Başlarken

pubspec.yaml dosyanıza şu satırı ekleyin:
dependencies:
  clipboard_formatter: ^0.1.0

Kullanım

Paketi içe aktarın:
import 'package:clipboard_formatter/clipboard_formatter.dart';

Telefon Numarası Biçimlendirme

// Temel kullanım
String formatted = ClipboardFormatter.formatPhoneNumber('5321234567');
// Sonuç: '532 123 45 67'

// Özel format ile
String customFormatted = ClipboardFormatter.formatPhoneNumber(
  '5321234567',
  customFormat: '(###) ###-####',
);
// Sonuç: '(532) 123-4567'

// Türk formatı (ülke kodu ile)
String turkishFormatted = ClipboardFormatter.formatTurkishPhoneNumber('5321234567');
// Sonuç: '+90 532 123 45 67'

// Başında sıfır olsa da çalışır
String turkishFormatted2 = ClipboardFormatter.formatTurkishPhoneNumber('05321234567');
// Sonuç: '+90 532 123 45 67'

Kredi Kartı Biçimlendirme

String formatted = ClipboardFormatter.formatCreditCard('1234567890123456');
// Sonuç: '1234 5678 9012 3456'

IBAN Biçimlendirme

String formatted = ClipboardFormatter.formatIBAN('TR330006100519786457841326');
// Sonuç: 'TR33 0006 1005 1978 6457 8413 26'

// Türk IBAN’ı (TR otomatik eklenir)
String turkishFormatted = ClipboardFormatter.formatTurkishIBAN('330006100519786457841326');
// Sonuç: 'TR33 0006 1005 1978 6457 8413 26'

// TR zaten varsa sorun olmaz
String turkishFormatted2 = ClipboardFormatter.formatTurkishIBAN('TR330006100519786457841326');
// Sonuç: 'TR33 0006 1005 1978 6457 8413 26'

Tarih Biçimlendirme

// Varsayılan biçim (G/A/Y ve '/' ayırıcı)
String formatted = ClipboardFormatter.formatDate('01022023');
// Sonuç: '01/02/2023'

// Özel desen ve ayırıcı
String customFormatted = ClipboardFormatter.formatDate(
  '01022023',
  pattern: 'ymd',
  separator: '-',
);
// Sonuç: '2023-01-02'

// Yıl önce geliyorsa
String yearFirstFormatted = ClipboardFormatter.formatDate(
  '20230102',
  isYearFirst: true,
);
// Sonuç: '02/01/2023'

// Varsayılan biçim (G/A/Y ve '/' ayırıcı)
String formatted = ClipboardFormatter.formatDate('01022023');
// Sonuç: '01/02/2023'

// Özel desen ve ayırıcı
String customFormatted = ClipboardFormatter.formatDate(
  '01022023',
  pattern: 'ymd',
  separator: '-',
);
// Sonuç: '2023-01-02'

// Yıl önce geliyorsa
String yearFirstFormatted = ClipboardFormatter.formatDate(
  '20230102',
  isYearFirst: true,
);
// Sonuç: '02/01/2023'

Örnek Kullanım

TextField(
  onChanged: (value) {
    setState(() {
      _formattedText = ClipboardFormatter.formatPhoneNumber(value);
    });
  },
  decoration: const InputDecoration(
    labelText: 'Telefon numarası girin',
  ),
),
Text('Biçimlendirilmiş: $_formattedText'),

Lisans

Bu proje MIT Lisansı ile lisanslanmıştır — detaylar için LICENSE dosyasına bakın.

