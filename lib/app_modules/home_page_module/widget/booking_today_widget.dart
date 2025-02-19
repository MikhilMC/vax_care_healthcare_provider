import 'package:flutter/material.dart';
import 'dart:math';
import 'package:faker/faker.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/view/appointment_details_screen.dart';

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
    _generateBookings();
  }

  void _generateBookings() {
    bookings = List.generate(10, (index) {
      return {
        "id": faker.guid.guid(),
        "childName": faker.person.firstName(),
        "parentName": faker.person.name(),
        "slot": slots[random.nextInt(slots.length)]
      };
    });

    // Sorting bookings based on slot time
    bookings.sort((a, b) {
      DateTime timeA = _parseSlotTime(a["slot"]!);
      DateTime timeB = _parseSlotTime(b["slot"]!);
      return timeA.compareTo(timeB);
    });

    setState(() {});
  }

// Function to parse slot time string into DateTime for comparison
  DateTime _parseSlotTime(String slot) {
    final timePattern = RegExp(r'(\d+):(\d+) (\wM)');
    final match = timePattern.firstMatch(slot);

    if (match != null) {
      int hour = int.parse(match.group(1)!);
      int minute = int.parse(match.group(2)!);
      String period = match.group(3)!;

      if (period == "PM" && hour != 12) hour += 12;
      if (period == "AM" && hour == 12) hour = 0;

      return DateTime(
          2000, 1, 1, hour, minute); // Using a dummy date for sorting
    }

    return DateTime(2000, 1, 1); // Default value (should never happen)
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
                return Card(
                  child: ListTile(
                    leading:
                        CircleAvatar(child: Text(booking["childName"]![0])),
                    title: Text(booking["childName"]!),
                    subtitle: Text("Parent: ${booking["parentName"]}"),
                    trailing: Text(booking["slot"]!),
                    onTap: () {
                      // Navigate to AppointmentDetailsWidget
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppointmentDetailsScreen(
                            appointment: booking,
                            vaccines: availableVaccines,
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
  }
}
