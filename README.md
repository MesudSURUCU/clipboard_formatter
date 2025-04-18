
![uyghur (1)](https://github.com/user-attachments/assets/3dc74549-d35e-42fc-a8ee-005cbade2a3a)

# 📋 Clipboard Formatter

A Flutter package for formatting various types of text data for clipboard operations.

Supports formatting for:

- 📞 Phone numbers  
- 💳 Credit card numbers  
- 🏦 IBAN numbers  
- 🗓️ Dates  
- 💰 Currency amounts

---

## ✨ Features

- **Phone Number Formatting**  
  Format raw phone numbers into readable formats.  
  Example: `5321234567 → 532 123 45 67`

- **Turkish Phone Number Formatting**  
  Automatically adds the Turkish country code.  
  Example: `5321234567 → +90 532 123 45 67`

- **Credit Card Formatting**  
  Adds spaces for readability.  
  Example: `1234567890123456 → 1234 5678 9012 3456`

- **IBAN Formatting**  
  Formats IBAN numbers into 4-character blocks.  

- **Turkish IBAN Formatting**  
  Automatically adds `TR` prefix for Turkish IBANs.

- **Date Formatting**  
  Supports different patterns: `DMY`, `MDY`, `YMD`  
  Custom separators also supported.

- **Currency Formatting**  
  Formats monetary values using appropriate symbols, separators and positioning.

---

## 🚀 Getting Started

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  clipboard_formatter: ^0.1.0
```

Then import:

```dart
import 'package:clipboard_formatter/clipboard_formatter.dart';
```

---

## 📞 Phone Number Formatting

```dart
// Basic usage
String formatted = ClipboardFormatter.formatPhoneNumber('5321234567');
// Result: '532 123 45 67'

// With custom format
String customFormatted = ClipboardFormatter.formatPhoneNumber(
  '5321234567',
  customFormat: '(###) ###-####',
);
// Result: '(532) 123-4567'

// Turkish phone number with country code
String turkishFormatted = ClipboardFormatter.formatTurkishPhoneNumber('5321234567');
// Result: '+90 532 123 45 67'

// Works with leading zero
String turkishFormatted2 = ClipboardFormatter.formatTurkishPhoneNumber('05321234567');
// Result: '+90 532 123 45 67'
```

---

## 💳 Credit Card Formatting

```dart
String formatted = ClipboardFormatter.formatCreditCard('1234567890123456');
// Result: '1234 5678 9012 3456'
```

---

## 🏦 IBAN Formatting

```dart
String formatted = ClipboardFormatter.formatIBAN('TR330006100519786457841326');
// Result: 'TR33 0006 1005 1978 6457 8413 26'

// Turkish IBAN formatting (auto-adds TR prefix)
String turkishFormatted = ClipboardFormatter.formatTurkishIBAN('330006100519786457841326');
// Result: 'TR33 0006 1005 1978 6457 8413 26'

// TR already present
String turkishFormatted2 = ClipboardFormatter.formatTurkishIBAN('TR330006100519786457841326');
// Result: 'TR33 0006 1005 1978 6457 8413 26'
```

---

## 🗓️ Date Formatting

```dart
// Default format (DMY with / separator)
String formatted = ClipboardFormatter.formatDate('01022023');
// Result: '01/02/2023'

// Custom pattern and separator
String customFormatted = ClipboardFormatter.formatDate(
  '01022023',
  pattern: 'ymd',
  separator: '-',
);
// Result: '2023-01-02'

// Input with year first
String yearFirstFormatted = ClipboardFormatter.formatDate(
  '20230102',
  isYearFirst: true,
);
// Result: '02/01/2023'
```

---

## 💰 Currency Formatting

```dart
// Default format (₺)
String formatted = ClipboardFormatter.formatCurrency('1234.56');
// Result: '₺ 1.234,56'

// Custom format
String customFormatted = ClipboardFormatter.formatCurrency(
  '1234.56',
  currencySymbol: '€',
  decimalSeparator: '.',
  thousandsSeparator: ',',
  symbolAtEnd: true,
);
// Result: '1,234.56 €'
```

---

## 📱 Example Use Case

```dart
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
```

---

## 📄 License

This project is licensed under the MIT License.  
See the [LICENSE](LICENSE) file for details.

---

# 📋 Clipboard Formatter (TR)

Clipboard işlemleri için çeşitli metin verilerini biçimlendirmeye yarayan bir Flutter paketi.

Aşağıdaki veri türleri için biçimlendirme sağlar:

- 📞 Telefon numaraları  
- 💳 Kredi kartı numaraları  
- 🏦 IBAN numaraları  
- 🗓️ Tarihler  
- 💰 Para birimi tutarları

---

## ✨ Özellikler

- **Telefon Numarası Biçimlendirme**  
  Ham numaraları okunabilir formata dönüştürür.  
  Örnek: `5321234567 → 532 123 45 67`

- **Türk Telefon Numarası Biçimlendirme**  
  Türkiye'nin ülke kodunu otomatik olarak ekler.  
  Örnek: `5321234567 → +90 532 123 45 67`

- **Kredi Kartı Biçimlendirme**  
  Okunabilirlik için boşluklar ekler.  
  Örnek: `1234567890123456 → 1234 5678 9012 3456`

- **IBAN Biçimlendirme**  
  IBAN'ları 4 karakterlik bloklara ayırır.  

- **Türk IBAN Biçimlendirme**  
  TR ön ekini otomatik olarak ekler.

- **Tarih Biçimlendirme**  
  DMY, MDY, YMD gibi desenleri destekler.  
  Ayrı ayraçlarla özelleştirilebilir.

- **Para Biçimlendirme**  
  Uygun para birimi simgeleri, ondalık ve binlik ayraçlarla biçimlendirir.

---

## 🚀 Başlarken

`pubspec.yaml` dosyanıza ekleyin:

```yaml
dependencies:
  clipboard_formatter: ^0.1.0
```

Sonra paketi içe aktarın:

```dart
import 'package:clipboard_formatter/clipboard_formatter.dart';
```

---

## 📞 Telefon Numarası Biçimlendirme

```dart
// Temel kullanım
String formatted = ClipboardFormatter.formatPhoneNumber('5321234567');
// Sonuç: '532 123 45 67'

// Özel format
String customFormatted = ClipboardFormatter.formatPhoneNumber(
  '5321234567',
  customFormat: '(###) ###-####',
);
// Sonuç: '(532) 123-4567'

// Türk formatı (ülke kodlu)
String turkishFormatted = ClipboardFormatter.formatTurkishPhoneNumber('5321234567');
// Sonuç: '+90 532 123 45 67'

// Başında sıfır olsa da çalışır
String turkishFormatted2 = ClipboardFormatter.formatTurkishPhoneNumber('05321234567');
// Sonuç: '+90 532 123 45 67'
```

---

## 💳 Kredi Kartı Biçimlendirme

```dart
String formatted = ClipboardFormatter.formatCreditCard('1234567890123456');
// Sonuç: '1234 5678 9012 3456'
```

---

## 🏦 IBAN Biçimlendirme

```dart
String formatted = ClipboardFormatter.formatIBAN('TR330006100519786457841326');
// Sonuç: 'TR33 0006 1005 1978 6457 8413 26'

// Türk IBAN biçimlendirme (TR otomatik eklenir)
String turkishFormatted = ClipboardFormatter.formatTurkishIBAN('330006100519786457841326');
// Sonuç: 'TR33 0006 1005 1978 6457 8413 26'

// TR zaten varsa
String turkishFormatted2 = ClipboardFormatter.formatTurkishIBAN('TR330006100519786457841326');
// Sonuç: 'TR33 0006 1005 1978 6457 8413 26'
```

---

## 🗓️ Tarih Biçimlendirme

```dart
// Varsayılan (G/A/Y ve '/' ayracı)
String formatted = ClipboardFormatter.formatDate('01022023');
// Sonuç: '01/02/2023'

// Özel desen ve ayırıcı
String customFormatted = ClipboardFormatter.formatDate(
  '01022023',
  pattern: 'ymd',
  separator: '-',
);
// Sonuç: '2023-01-02'

// Yıl önce gelirse
String yearFirstFormatted = ClipboardFormatter.formatDate(
  '20230102',
  isYearFirst: true,
);
// Sonuç: '02/01/2023'
```

---

## 💰 Para Birimi Biçimlendirme

```dart
// Varsayılan biçim (₺)
String formatted = ClipboardFormatter.formatCurrency('1234.56');
// Sonuç: '₺ 1.234,56'

// Özel biçim
String customFormatted = ClipboardFormatter.formatCurrency(
  '1234.56',
  currencySymbol: '€',
  decimalSeparator: '.',
  thousandsSeparator: ',',
  symbolAtEnd: true,
);
// Sonuç: '1,234.56 €'
```

---

## 📱 Örnek Kullanım

```dart
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
```

---

## 📄 Lisans

Bu proje MIT Lisansı ile lisanslanmıştır.  
Detaylar için [LICENSE](LICENSE) dosyasına göz atın.

