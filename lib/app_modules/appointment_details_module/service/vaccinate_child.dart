import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vax_care_healthcare_provider/app_constants/app_urls.dart';

import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/model/vaccination_response_model.dart';

Future<VaccinationResponseModel> vaccinateChild({
  required int bookingId,
  required double height,
  required double weight,
}) async {
  try {
    Map<String, dynamic> params = {
      "id": bookingId.toString(),
      "height": height.toString(),
      "weight": weight.toString(),
    };

    final resp = await http.patch(
      Uri.parse(AppUrls.vaccinateChildUrl),
      body: jsonEncode(params),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8"
      },
    );

    if (resp.statusCode == 200) {
      final dynamic decoded = jsonDecode(resp.body);
      final VaccinationResponseModel response =
          VaccinationResponseModel.fromJson(decoded);

      return response;
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
      throw Exception(
        errorResponse['message'] ?? 'Unknown error',
      );
    }
  } on SocketException {
    throw Exception('No Internet connection');
  } on HttpException {
    throw Exception('Server error');
  } on FormatException {
    throw Exception('Bad response format');
  } catch (e) {
    throw Exception('Unexpected error: ${e.toString()}');
  }
}
