// To parse this JSON data, do
//
//     final vaccinationResponseData = vaccinationResponseDataFromJson(jsonString);

import 'dart:convert';

VaccinationResponseData vaccinationResponseDataFromJson(String str) =>
    VaccinationResponseData.fromJson(json.decode(str));

String vaccinationResponseDataToJson(VaccinationResponseData data) =>
    json.encode(data.toJson());

class VaccinationResponseData {
  int id;
  String ageGroup;
  int maxChildren;
  DateTime date;
  String status;
  DateTime createdAt;
  int child;
  int parent;
  int healthProvider;
  int timeSlot;
  List<int> vaccines;

  VaccinationResponseData({
    required this.id,
    required this.ageGroup,
    required this.maxChildren,
    required this.date,
    required this.status,
    required this.createdAt,
    required this.child,
    required this.parent,
    required this.healthProvider,
    required this.timeSlot,
    required this.vaccines,
  });

  factory VaccinationResponseData.fromJson(Map<String, dynamic> json) =>
      VaccinationResponseData(
        id: json["id"],
        ageGroup: json["age_group"],
        maxChildren: json["max_children"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        child: json["child"],
        parent: json["parent"],
        healthProvider: json["health_provider"],
        timeSlot: json["time_slot"],
        vaccines: List<int>.from(json["vaccines"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "age_group": ageGroup,
        "max_children": maxChildren,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "child": child,
        "parent": parent,
        "health_provider": healthProvider,
        "time_slot": timeSlot,
        "vaccines": List<dynamic>.from(vaccines.map((x) => x)),
      };
}
