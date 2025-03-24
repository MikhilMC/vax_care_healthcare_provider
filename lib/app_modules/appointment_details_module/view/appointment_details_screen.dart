// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/bloc/booking_details_bloc/booking_details_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/bloc/vaccinate_child_bloc/vaccinate_child_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/widget/appointment_form.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/widget/child_details_card.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/widget/vaccine_checklist_card.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/view/home_screen.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_helpers.dart';
import 'package:vax_care_healthcare_provider/app_widgets/custom_error_widget.dart';
import 'package:vax_care_healthcare_provider/app_widgets/overlay_loader_widget.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final int bookingId;

  const AppointmentDetailsScreen({
    super.key,
    required this.bookingId,
  });

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final Map<String, bool> vaccineChecks = {};

  @override
  void initState() {
    super.initState();
    context.read<BookingDetailsBloc>().add(
          BookingDetailsEvent.bookingDetailsFetched(
            widget.bookingId,
          ),
        );
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool get _didallVaccinesComplete {
    bool allChecked = vaccineChecks.values.every((checked) => checked);
    return allChecked;
  }

  void _vaccinate() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate() && _didallVaccinesComplete) {
      if (_didallVaccinesComplete) {
        final VaccinateChildBloc vaccinateChildBloc =
            BlocProvider.of<VaccinateChildBloc>(context);

        vaccinateChildBloc.add(VaccinateChildEvent.childVaccinated(
          widget.bookingId,
          double.parse(_heightController.text.trim()),
          double.parse(_weightController.text.trim()),
        ));
      } else {
        AppHelpers.showErrorDialogue(
          context,
          "Please complete all vaccines booked to the child",
        );
      }
    } else {
      AppHelpers.showErrorDialogue(
        context,
        "Please add height and weight of the child.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.01,
        ),
        child: BlocBuilder<BookingDetailsBloc, BookingDetailsState>(
          builder: (context, state) {
            if (state is BookingDetailsError) {
              return CustomErrorWidget(
                errorMessage: state.errorMessage,
              );
            }

            if (state is! BookingDetailsSuccess) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.firstColor,
                ),
              );
            }

            final bookingDetails = state.vaccineBooking;
            return BlocConsumer<VaccinateChildBloc, VaccinateChildState>(
              listener: (context, state) {
                state.whenOrNull(
                  loading: () {},
                  success: (response) {
                    if (response.status == "success") {
                      AppHelpers.showCustomSnackBar(
                        context,
                        "Child vaccinated successfully",
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
                        "Child Vaccination Failed",
                      );
                    }
                  },
                  failed: (errorMessage) => AppHelpers.showErrorDialogue(
                    context,
                    "Child Vaccination Failed: $errorMessage",
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
                  childWidget: CustomScrollView(
                    slivers: [
                      ChildDetailsCard(appointment: bookingDetails),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                      ),
                      SliverList.builder(
                        itemBuilder: (context, index) {
                          return VaccineChecklistCard(
                            vaccine: bookingDetails.vaccines[index],
                            vaccineCheckValue: vaccineChecks[bookingDetails
                                    .vaccines[index].vaccineName] ??
                                false,
                            onSelect: (value) {
                              setState(() {
                                vaccineChecks[bookingDetails.vaccines[index]
                                    .vaccineName] = value ?? false;
                              });
                            },
                          );
                        },
                        itemCount: bookingDetails.vaccines.length,
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                      ),
                      AppointmentForm(
                        formKey: _formKey,
                        heightController: _heightController,
                        weightController: _weightController,
                        onSubmitted: _vaccinate,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
