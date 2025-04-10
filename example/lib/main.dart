import 'package:flutter/material.dart';
import 'package:clipboard_formatter/clipboard_formatter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clipboard Formatter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FormatterDemo(),
    );
  }
}

class FormatterDemo extends StatefulWidget {
  const FormatterDemo({super.key});

  @override
  State<FormatterDemo> createState() => _FormatterDemoState();
}

class _FormatterDemoState extends State<FormatterDemo> {
  String _formattedPhoneText = '';
  String _formattedTurkishPhoneText = '';
  String _formattedCreditCardText = '';
  String _formattedIbanText = '';
  String _formattedTurkishIbanText = '';
  String _formattedDateText = '';
  String _formattedCurrencyText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clipboard Formatter Example'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildFormatterSection(
                title: 'Phone Number',
                hint: 'Enter phone number (e.g. 5321234567)',
                formatted: _formattedPhoneText,
                onChanged: (value) {
                  setState(() {
                    _formattedPhoneText =
                        ClipboardFormatter.formatPhoneNumber(value);
                  });
                },
              ),
              _buildFormatterSection(
                title: 'Turkish Phone Number',
                hint: 'Enter phone number (e.g. 5321234567)',
                formatted: _formattedTurkishPhoneText,
                onChanged: (value) {
                  setState(() {
                    _formattedTurkishPhoneText =
                        ClipboardFormatter.formatTurkishPhoneNumber(value);
                  });
                },
              ),
              _buildFormatterSection(
                title: 'Credit Card',
                hint: 'Enter credit card number',
                formatted: _formattedCreditCardText,
                onChanged: (value) {
                  setState(() {
                    _formattedCreditCardText =
                        ClipboardFormatter.formatCreditCard(value);
                  });
                },
              ),
              _buildFormatterSection(
                title: 'IBAN',
                hint: 'Enter IBAN number',
                formatted: _formattedIbanText,
                onChanged: (value) {
                  setState(() {
                    _formattedIbanText = ClipboardFormatter.formatIBAN(value);
                  });
                },
              ),
              _buildFormatterSection(
                title: 'Turkish IBAN',
                hint: 'Enter IBAN number (with or without TR)',
                formatted: _formattedTurkishIbanText,
                onChanged: (value) {
                  setState(() {
                    _formattedTurkishIbanText =
                        ClipboardFormatter.formatTurkishIBAN(value);
                  });
                },
              ),
              _buildFormatterSection(
                title: 'Date',
                hint: 'Enter date (DDMMYYYY)',
                formatted: _formattedDateText,
                onChanged: (value) {
                  setState(() {
                    _formattedDateText = ClipboardFormatter.formatDate(
                      value,
                      separator: '/',
                      pattern: 'dmy',
                    );
                  });
                },
              ),
              _buildFormatterSection(
                title: 'Currency',
                hint: 'Enter amount (e.g. 1234.56)',
                formatted: _formattedCurrencyText,
                onChanged: (value) {
                  setState(() {
                    _formattedCurrencyText = ClipboardFormatter.formatCurrency(
                      value,
                      currencySymbol: '₺',
                      decimalSeparator: ',',
                      thousandsSeparator: '.',
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormatterSection({
    required String title,
    required String hint,
    required String formatted,
    required Function(String) onChanged,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                labelText: hint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text(
                    'Formatted: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Text(
                      formatted,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                  if (formatted.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        // Copy formatted text to clipboard
                        // In a real application, use Clipboard.setData
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Copied: $formatted')),
                        );
                      },
                      tooltip: 'Copy to clipboard',
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
