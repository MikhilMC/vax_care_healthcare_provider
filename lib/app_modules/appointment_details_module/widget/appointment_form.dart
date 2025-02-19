// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';
import 'package:vax_care_healthcare_provider/app_widgets/normal_text_field.dart';

class AppointmentForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final VoidCallback onSubmitted;

  const AppointmentForm({
    super.key,
    required this.formKey,
    required this.heightController,
    required this.weightController,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.0125,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                NormalTextField(
                  textEditingController: heightController,
                  validatorFunction: (value) {
                    // if (value == null || value.isEmpty) {
                    //   return 'Please enter height';
                    // }
                    // if (double.tryParse(value.trim()) == null) {
                    //   return 'Please enter a valid number';
                    // }
                    return null;
                  },
                  labelText: "Height",
                  hintText: "Enter child's height",
                  textInputType: TextInputType.number,
                ),
                SizedBox(
                  height: screenSize.height * 0.0125,
                ),
                NormalTextField(
                  textEditingController: weightController,
                  validatorFunction: (value) {
                    // if (value == null || value.isEmpty) {
                    //   return 'Please enter weight';
                    // }
                    // if (double.tryParse(value.trim()) == null) {
                    //   return 'Please enter a valid number';
                    // }
                    return null;
                  },
                  labelText: "Weight",
                  hintText: "Enter child's weight",
                  textInputType: TextInputType.number,
                ),
                SizedBox(
                  height: screenSize.height * 0.0125,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: AppColors.firstColor,
                    ),
                    onPressed: onSubmitted,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Vaccinate',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
