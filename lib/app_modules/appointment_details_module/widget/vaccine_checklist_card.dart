// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vax_care_healthcare_provider/app_models/vaccine/vaccine.dart';

class VaccineChecklistCard extends StatefulWidget {
  final Vaccine vaccine;
  final bool vaccineCheckValue;
  final Function(bool?)? onSelect;
  const VaccineChecklistCard({
    super.key,
    required this.vaccine,
    required this.vaccineCheckValue,
    this.onSelect,
  });

  @override
  State<VaccineChecklistCard> createState() => _VaccineChecklistCardState();
}

class _VaccineChecklistCardState extends State<VaccineChecklistCard> {
  bool _isEnabled = true;

  void _onSelect(bool? value) {
    widget.onSelect!(value);
    setState(() {
      _isEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: CheckboxListTile(
        title: Text(widget.vaccine.vaccineName),
        value: widget.vaccineCheckValue,
        onChanged: (value) => _onSelect(value),
        enabled: _isEnabled,
      ),
    );
  }
}
