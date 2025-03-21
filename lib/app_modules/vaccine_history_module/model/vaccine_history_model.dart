// To parse this JSON data, do
//
//     final vaccineHistoryModel = vaccineHistoryModelFromJson(jsonString);

import 'dart:convert';

List<VaccineHistoryModel> vaccineHistoryModelFromJson(String str) =>
    List<VaccineHistoryModel>.from(
        json.decode(str).map((x) => VaccineHistoryModel.fromJson(x)));

String vaccineHistoryModelToJson(List<VaccineHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VaccineHistoryModel {
  int id;
  String childName;
  String parentName;
  String phoneNumber;

  VaccineHistoryModel({
    required this.id,
    required this.childName,
    required this.parentName,
    required this.phoneNumber,
  });

  factory VaccineHistoryModel.fromJson(Map<String, dynamic> json) =>
      VaccineHistoryModel(
        id: json["id"],
        childName: json["child_name"],
        parentName: json["parent_name"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "child_name": childName,
        "parent_name": parentName,
        "phone_number": phoneNumber,
      };
}
