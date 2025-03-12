// To parse this JSON data, do
//
//     final vaccine = vaccineFromJson(jsonString);

import 'dart:convert';

List<Vaccine> vaccineFromJson(String str) =>
    List<Vaccine>.from(json.decode(str).map((x) => Vaccine.fromJson(x)));

String vaccineToJson(List<Vaccine> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vaccine {
  int id;
  String vaccineName;
  String administration;

  Vaccine({
    required this.id,
    required this.vaccineName,
    required this.administration,
  });

  factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        id: json["id"],
        vaccineName: json["vaccine_name"],
        administration: json["administration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vaccine_name": vaccineName,
        "administration": administration,
      };
}
