// To parse this JSON data, do
//
//     final vaccinationResponseModel = vaccinationResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/model/vaccination_response_data.dart';

VaccinationResponseModel vaccinationResponseModelFromJson(String str) =>
    VaccinationResponseModel.fromJson(json.decode(str));

String vaccinationResponseModelToJson(VaccinationResponseModel data) =>
    json.encode(data.toJson());

class VaccinationResponseModel {
  String status;
  String message;
  VaccinationResponseData data;

  VaccinationResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VaccinationResponseModel.fromJson(Map<String, dynamic> json) =>
      VaccinationResponseModel(
        status: json["status"],
        message: json["message"],
        data: VaccinationResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}
