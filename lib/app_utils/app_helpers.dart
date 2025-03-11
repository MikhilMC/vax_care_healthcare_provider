import 'package:flutter/material.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';

class AppHelpers {
  static Future<void> showErrorDialogue(
    BuildContext context,
    String message,
  ) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.green.shade100,
          titleTextStyle: const TextStyle(
            color: Colors.redAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 15,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: AppColors.thirdColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.firstColor, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        behavior: SnackBarBehavior.floating, // Floating style
        margin: EdgeInsets.all(10.0), // Margin for floating behavior
        duration: Duration(seconds: 3), // Duration to display
      ),
    );
  }

  static String formatTime(String time) {
    List<String> parts = time.split(":");
    int hour = int.parse(parts[0]);
    String minute = parts[1];
    String period = hour >= 12 ? "PM" : "AM";

    // Convert to 12-hour format
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour; // Handle midnight and noon

    return "$hour:$minute $period";
  }
}
