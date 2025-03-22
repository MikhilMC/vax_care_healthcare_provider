import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/view/home_screen.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/bloc/request_stock_bloc/request_stock_bloc.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_helpers.dart';
import 'package:vax_care_healthcare_provider/app_widgets/overlay_loader_widget.dart';

class RequestStockForm extends StatefulWidget {
  const RequestStockForm({super.key});

  @override
  State<RequestStockForm> createState() => _RequestStockFormState();
}

class _RequestStockFormState extends State<RequestStockForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _quantityController = TextEditingController();
  String? _selectedAgeGroup;

  final List<String> _ageGroups = [
    '6 weeks',
    '10 weeks',
    '14 weeks',
    '9-12 months',
    '16-24 months',
    '5-6 years',
    '10 years',
    '16 years',
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedAgeGroup != null) {
        final RequestStockBloc requestStockBloc =
            BlocProvider.of<RequestStockBloc>(context);

        requestStockBloc.add(RequestStockEvent.stockRequested(
          _selectedAgeGroup!,
          int.parse(_quantityController.text.trim()),
        ));
      } else {
        AppHelpers.showErrorDialogue(
          context,
          "Please select a child age group.",
        );
      }
    } else {
      AppHelpers.showErrorDialogue(
        context,
        "Please add vaccine stock amount.",
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
    return BlocConsumer<RequestStockBloc, RequestStockState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {},
          success: (response) {
            if (response.message == "Stock request submitted successfully") {
              AppHelpers.showCustomSnackBar(
                context,
                "Requested vaccine stock successfully",
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            } else {
              AppHelpers.showErrorDialogue(
                context,
                "Vaccine stock request failed",
              );
            }
          },
          failure: (errorMessage) => AppHelpers.showErrorDialogue(
            context,
            "Vaccine stock request failed: $errorMessage",
          ),
        );
      },
      builder: (context, state) {
        bool isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return OverlayLoaderWidget(
          isLoading: isLoading,
          childWidget: Padding(
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
          ),
        );
      },
    );
  }
}
