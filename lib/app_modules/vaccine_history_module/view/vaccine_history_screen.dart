import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // For date formatting

import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_history_module/hospital_vaccine_history_bloc/hospital_vaccine_history_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_history_module/widget/vaccine_history_card.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_helpers.dart';
import 'package:vax_care_healthcare_provider/app_widgets/custom_error_widget.dart';
import 'package:vax_care_healthcare_provider/app_widgets/empty_list.dart'; // For generating random data

class VaccineHistoryScreen extends StatefulWidget {
  const VaccineHistoryScreen({super.key});

  @override
  State<VaccineHistoryScreen> createState() => _VaccineHistoryScreenState();
}

class _VaccineHistoryScreenState extends State<VaccineHistoryScreen> {
  DateTime? _selectedDate;
  final TextEditingController _controller = TextEditingController();
  bool _showHistory = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = now.subtract(const Duration(days: 30));
    final DateTime lastDate = now;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _showHistory = false;
        _controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  // Function to handle submit button press
  void _onSubmit() {
    if (_selectedDate != null) {
      final HospitalVaccineHistoryBloc hospitalVaccineHistoryBloc =
          BlocProvider.of<HospitalVaccineHistoryBloc>(context);

      hospitalVaccineHistoryBloc.add(
          HospitalVaccineHistoryEvent.hospitalVaccineHistoryFetched(
              _selectedDate!));
      setState(() {
        _showHistory = true;
      });
    } else {
      AppHelpers.showErrorDialogue(
        context,
        "Please select date.",
      );
      setState(() {
        _showHistory = false;
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
            if (_showHistory)
              BlocBuilder<HospitalVaccineHistoryBloc,
                  HospitalVaccineHistoryState>(
                builder: (context, state) {
                  if (state is HospitalVaccineHistoryError) {
                    return CustomErrorWidget(
                      errorMessage: state.errorMessage,
                    );
                  }

                  if (state is HospitalVaccineHistoryEmpty) {
                    return EmptyList(
                      message: "No vaccination on this day",
                    );
                  }

                  if (state is! HospitalVaccineHistorySuccess) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.firstColor,
                      ),
                    );
                  }

                  final hospitalVaccineHistory = state.vaccineHistory;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: hospitalVaccineHistory.length,
                      itemBuilder: (context, index) {
                        return VaccineHistoryCard(
                          childrenVaccinated: hospitalVaccineHistory[index],
                        );
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
