import 'package:flutter/material.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_history_module/model/vaccine_history_model.dart';

class VaccineHistoryCard extends StatelessWidget {
  const VaccineHistoryCard({
    super.key,
    required this.childrenVaccinated,
  });

  final VaccineHistoryModel childrenVaccinated;

  @override
  Widget build(BuildContext context) {
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
              'Child: ${childrenVaccinated.childName}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Parent: ${childrenVaccinated.parentName}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Phone: ${childrenVaccinated.phoneNumber}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
