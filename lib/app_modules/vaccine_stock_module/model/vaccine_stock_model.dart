// To parse this JSON data, do
//
//     final vaccineStockModel = vaccineStockModelFromJson(jsonString);

import 'dart:convert';

List<VaccineStockModel> vaccineStockModelFromJson(String str) =>
    List<VaccineStockModel>.from(
        json.decode(str).map((x) => VaccineStockModel.fromJson(x)));

String vaccineStockModelToJson(List<VaccineStockModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VaccineStockModel {
  int id;
  int stock;
  int healthProvider;
  int vaccine;
  VaccineDetails vaccineDetails;

  VaccineStockModel({
    required this.id,
    required this.stock,
    required this.healthProvider,
    required this.vaccine,
    required this.vaccineDetails,
  });

  factory VaccineStockModel.fromJson(Map<String, dynamic> json) =>
      VaccineStockModel(
        id: json["id"],
        stock: json["stock"],
        healthProvider: json["health_provider"],
        vaccine: json["vaccine"],
        vaccineDetails: VaccineDetails.fromJson(json["vaccine_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stock": stock,
        "health_provider": healthProvider,
        "vaccine": vaccine,
        "vaccine_details": vaccineDetails.toJson(),
      };
}

class VaccineDetails {
  String vaccineName;
  String ageGroup;
  Administration administration;
  String protection;
  String sideEffects;

  VaccineDetails({
    required this.vaccineName,
    required this.ageGroup,
    required this.administration,
    required this.protection,
    required this.sideEffects,
  });

  factory VaccineDetails.fromJson(Map<String, dynamic> json) => VaccineDetails(
        vaccineName: json["vaccine_name"],
        ageGroup: json["age_group"],
        administration: administrationValues.map[json["administration"]]!,
        protection: json["protection"],
        sideEffects: json["side_effects"],
      );

  Map<String, dynamic> toJson() => {
        "vaccine_name": vaccineName,
        "age_group": ageGroup,
        "administration": administrationValues.reverse[administration],
        "protection": protection,
        "side_effects": sideEffects,
      };
}

// ignore: constant_identifier_names
enum Administration { INJECTION, ORAL }

final administrationValues = EnumValues(
    {"Injection": Administration.INJECTION, "Oral": Administration.ORAL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
