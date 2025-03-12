import 'package:flutter/material.dart';
import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/view/appointment_details_screen.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/bloc/booking_today_bloc/bookings_today_bloc.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_helpers.dart';
import 'package:vax_care_healthcare_provider/app_widgets/custom_error_widget.dart';
import 'package:vax_care_healthcare_provider/app_widgets/empty_list.dart';

final faker = Faker();
final random = Random();

class BookingTodayWidget extends StatefulWidget {
  const BookingTodayWidget({super.key});

  @override
  State<BookingTodayWidget> createState() => _BookingTodayWidgetState();
}

class _BookingTodayWidgetState extends State<BookingTodayWidget> {
  List<String> slots = [
    "8:00 AM - 8:30 AM",
    "8:30 AM - 9:00 AM",
    "9:00 AM - 9:30 AM",
    "9:30 AM - 10:00 AM",
    "10:00 AM - 10:30 AM",
    "10:30 AM - 11:00 AM",
    "11:00 AM - 11:30 AM",
    "11:30 AM - 12:00 PM",
    "12:00 PM - 12:30 PM",
    "12:30 PM - 1:00 PM",
    "1:00 PM - 1:30 PM",
    "1:30 PM - 2:00 PM",
    "2:00 PM - 2:30 PM",
    "2:30 PM - 3:00 PM",
    "3:00 PM - 3:30 PM",
    "3:30 PM - 4:00 PM"
  ];

  List<Map<String, String>> bookings = [];
  List<String> availableVaccines = [
    "BCG",
    "Hepatitis B",
    "Polio",
    "DTP",
    "Hib",
    "Rotavirus",
    "Pneumococcal"
  ];

  @override
  void initState() {
    super.initState();
    context.read<BookingsTodayBloc>().add(BookingsTodayEvent.bookingsFetched());
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<BookingsTodayBloc, BookingsTodayState>(
      builder: (context, state) {
        if (state is BookingsTodayError) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        }

        if (state is BookingsTodayEmpty) {
          return EmptyList(
            message: "No Bookings Today",
          );
        }

        if (state is! BookingsTodaySuccess) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.firstColor,
            ),
          );
        }

        final bookings = state.bookings;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Bookings",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    final slot =
                        "${AppHelpers.formatTime(booking.startTime)} - ${AppHelpers.formatTime(booking.endTime)}";
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(booking.childName[0]),
                        ),
                        title: Text(booking.childName),
                        subtitle: Text("Parent: ${booking.parentName}"),
                        trailing: Text(slot),
                        onTap: () {
                          // Navigate to AppointmentDetailsWidget
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentDetailsScreen(
                                bookingId: booking.id,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                    height: screenSize.height * 0.005,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
