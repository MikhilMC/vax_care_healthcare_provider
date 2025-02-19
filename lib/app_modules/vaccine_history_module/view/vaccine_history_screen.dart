import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:faker/faker.dart'; // For generating fake data
import 'dart:math';

import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart'; // For generating random data

class VaccineHistoryScreen extends StatefulWidget {
  const VaccineHistoryScreen({super.key});

  @override
  State<VaccineHistoryScreen> createState() => _VaccineHistoryScreenState();
}

class _VaccineHistoryScreenState extends State<VaccineHistoryScreen> {
  DateTime? selectedDate;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> childrenVaccinated = [];

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = now.subtract(const Duration(days: 30));
    final DateTime lastDate = now;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  // Function to generate random vaccine history data
  List<Map<String, String>> _generateVaccineHistory() {
    final faker = Faker();
    final random = Random();
    List<Map<String, String>> childrenVaccinated = [];
    for (int i = 0; i < 10; i++) {
      childrenVaccinated.add({
        'childName': faker.person.name(),
        'parentName': faker.person.name(),
        'phoneNumber': faker.phoneNumber.us(),
      });
    }
    childrenVaccinated.shuffle(random);
    return childrenVaccinated;
  }

  // Function to handle submit button press
  void _onSubmit() {
    if (selectedDate != null) {
      setState(() {
        childrenVaccinated = _generateVaccineHistory();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccine History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Field with Calendar Icon
            TextFormField(
              controller: _controller,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Select Date',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: AppColors.firstColor,
                ),
                onPressed: _onSubmit,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Get History',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ListView to show children vaccinated
            if (childrenVaccinated.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: childrenVaccinated.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Child: ${childrenVaccinated[index]['childName']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Parent: ${childrenVaccinated[index]['parentName']}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Phone: ${childrenVaccinated[index]['phoneNumber']}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
