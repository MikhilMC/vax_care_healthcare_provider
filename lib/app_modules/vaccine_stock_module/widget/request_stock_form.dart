import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RequestStockForm extends StatefulWidget {
  const RequestStockForm({super.key});

  @override
  State<RequestStockForm> createState() => _RequestStockFormState();
}

class _RequestStockFormState extends State<RequestStockForm> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  String? _selectedAgeGroup;

  final List<String> _ageGroups = [
    '6 weeks',
    '10 weeks',
    '14 weeks',
    '9 - 12 months',
    '16 - 24 months',
    '5 - 6 years',
    '10 years',
    '16 years',
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with submission
      final ageGroup = _selectedAgeGroup;
      final quantity = _quantityController.text;

      // Here you can handle the form submission, e.g., send data to the server
      if (kDebugMode) {
        print('Age Group: $ageGroup');
        print('Quantity: $quantity');
      }

      // Show a success message or navigate to another screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request submitted successfully!')),
      );
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dropdown for age group
            DropdownButtonFormField<String>(
              value: _selectedAgeGroup,
              decoration: const InputDecoration(
                labelText: 'Select Age Group',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              items: _ageGroups.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAgeGroup = newValue;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an age group';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Text field for quantity
            TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a quantity';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Submit button
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Submit Request',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
