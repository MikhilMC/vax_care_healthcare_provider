import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:vax_care_healthcare_provider/app_constants/app_urls.dart';
import 'package:vax_care_healthcare_provider/app_models/vaccine_booking_model/vaccine_booking_model.dart';

Future<VaccineBookingModel> getVaccineBookingDetails({
  required int bookingId,
}) async {
  try {
    Map<String, dynamic> params = {
      "id": bookingId.toString(),
    };

    // Construct the URL with query parameters
    final url = Uri.parse(AppUrls.getBookingDetailsUrl).replace(
      queryParameters: params,
    );

    final resp = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = VaccineBookingModel.fromJson(decoded);

      return response;
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
      throw Exception(
        '${errorResponse['message'] ?? 'Unknown error'}',
      );
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception(e.toString());
  }
}
