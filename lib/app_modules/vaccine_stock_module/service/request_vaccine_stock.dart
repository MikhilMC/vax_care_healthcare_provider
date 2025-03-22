import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:vax_care_healthcare_provider/app_constants/app_urls.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/model/stock_request_response_model.dart';

Future<StockRequestResponseModel> requestVaccineStock({
  required String ageGroup,
  required int quantity,
}) async {
  try {
    int healthcareProviderId = 22;
    Map<String, dynamic> body = {
      "health_provider": healthcareProviderId.toString(),
      "age_group": ageGroup,
      "quantity": quantity.toString(),
    };

    final resp = await http.post(
      Uri.parse(AppUrls.requestVaccineStockUrl),
      body: jsonEncode(body),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8"
      },
    );

    if (resp.statusCode == 201) {
      final dynamic decoded = jsonDecode(resp.body);
      final StockRequestResponseModel response =
          StockRequestResponseModel.fromJson(decoded);

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
