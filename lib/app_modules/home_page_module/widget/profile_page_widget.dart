import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';

import 'package:vax_care_healthcare_provider/app_modules/home_page_module/bloc/parent_data_bloc/profile_data_bloc.dart';
import 'package:vax_care_healthcare_provider/app_widgets/custom_error_widget.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileDataBloc>().add(ProfileDataEvent.profileDataFetched());
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<ProfileDataBloc, ProfileDataState>(
      builder: (context, state) {
        if (state is ProfileDataError) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        }

        if (state is! ProfileDataSuccess) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.firstColor,
            ),
          );
        }

        final profileData = state.profile;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.01,
          ),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.05,
                vertical: screenSize.height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.local_hospital,
                    size: 40,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    profileData.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Type: ${profileData.providerType}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          profileData.address,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        profileData.phone,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.email,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        profileData.email,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.map,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Lat: ${profileData.latitude}, Lon: ${profileData.longitude}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.open_in_new,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          _openGoogleMaps(
                            double.parse(profileData.latitude),
                            (double.parse(profileData.longitude)),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Tomorrow's Bookings:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${profileData.nextDayBookingCount}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
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

  /// Open Google Maps in the default map application or show an error dialog if it fails.
  Future<void> _openGoogleMaps(
    double lat,
    double lon,
  ) async {
    final Uri googleMapsUri = Uri.parse("geo:$lat,$lon?q=$lat,$lon");
    final Uri webUri =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lon");

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri);
    } else if (await canLaunchUrl(webUri)) {
      await launchUrl(webUri);
    } else {
      if (mounted) {
        _showErrorDialog(context);
      }
    }
  }

  /// Show an alert dialog when launching the map fails.
  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text(
            "Could not open the map application. Please try again.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
