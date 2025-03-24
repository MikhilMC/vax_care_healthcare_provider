import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:vax_care_healthcare_provider/app_constants/app_urls.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_history_module/model/vaccine_history_model.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_localstorage.dart';

Future<List<VaccineHistoryModel>> getHospitalVaccineHistory({
  required DateTime date,
}) async {
  try {
    int healthcareProviderId = await AppLocalstorage.getHospitalId();
    Map<String, dynamic> params = {
      "id": healthcareProviderId.toString(),
      "date":
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}"
    };

    // Construct the URL with query parameters
    final url = Uri.parse(AppUrls.getHospitalVaccineHistoryUrl).replace(
      queryParameters: params,
    );

    final resp = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (resp.statusCode == 200) {
      final List<dynamic> decoded = jsonDecode(resp.body);
      final response =
          decoded.map((item) => VaccineHistoryModel.fromJson(item)).toList();

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
