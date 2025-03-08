import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vax_care_healthcare_provider/app_constants/app_urls.dart';

import 'package:vax_care_healthcare_provider/app_modules/home_page_module/model/profile_model.dart';

Future<ProfileModel> getProfileData() async {
  try {
    int parentId = 20;
    Map<String, dynamic> params = {
      "id": parentId.toString(),
    };
    // Construct the URL with query parameters
    final url = Uri.parse(AppUrls.getProfileDetailsUrl).replace(
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
      final response = ProfileModel.fromJson(decoded);
      return response;
    } else {
      throw Exception('Failed to load response');
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
