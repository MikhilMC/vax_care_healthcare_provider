import 'package:flutter/material.dart';
import 'dart:math';

import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/widget/vaccine_stock_card.dart';

class DisplayVaccineStock extends StatelessWidget {
  const DisplayVaccineStock({super.key});

  // List of vaccines with name, description, and age group
  static const List<Map<String, String>> _vaccines = [
    {
      'name': 'BCG',
      'description': 'Protects against tuberculosis',
      'ageGroup': 'At birth'
    },
    {
      'name': 'Hepatitis B',
      'description': 'Protects against hepatitis B',
      'ageGroup': 'At birth, 6 weeks, 10 weeks, 14 weeks'
    },
    {
      'name': 'OPV',
      'description': 'Oral polio vaccine',
      'ageGroup': 'At birth, 6 weeks, 10 weeks, 14 weeks'
    },
    {
      'name': 'IPV',
      'description': 'Inactivated polio vaccine',
      'ageGroup': '6 weeks, 14 weeks'
    },
    {
      'name': 'Pentavalent',
      'description':
          'Protects against diphtheria, pertussis, tetanus, hepatitis B, and Hib',
      'ageGroup': '6 weeks, 10 weeks, 14 weeks'
    },
    {
      'name': 'Rotavirus',
      'description': 'Protects against rotavirus diarrhea',
      'ageGroup': '6 weeks, 10 weeks, 14 weeks'
    },
    {
      'name': 'PCV',
      'description': 'Pneumococcal conjugate vaccine',
      'ageGroup': '6 weeks, 14 weeks, 9 months'
    },
    {
      'name': 'Measles-Rubella',
      'description': 'Protects against measles and rubella',
      'ageGroup': '9-12 months, 16-24 months'
    },
    {
      'name': 'JE',
      'description': 'Japanese encephalitis vaccine',
      'ageGroup': '9-12 months, 16-24 months'
    },
    {
      'name': 'DPT Booster',
      'description': 'Booster for diphtheria, pertussis, and tetanus',
      'ageGroup': '16-24 months, 5-6 years'
    },
    {
      'name': 'TT',
      'description': 'Tetanus toxoid',
      'ageGroup': '10 years, 16 years'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _vaccines.length,
      itemBuilder: (context, index) {
        final vaccine = _vaccines[index];
        // Random data generator for vaccine stock
        final Random random = Random();
        final stock =
            random.nextInt(100); // Random stock value between 0 and 99
        return VaccineStockCard(
          vaccine: vaccine,
          stock: stock,
        );
      },
    );
  }
}
