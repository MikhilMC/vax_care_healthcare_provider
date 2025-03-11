// To parse this JSON data, do
//
//     final vaccineBookingModel = vaccineBookingModelFromJson(jsonString);

import 'dart:convert';

List<VaccineBookingModel> vaccineBookingModelFromJson(String str) =>
    List<VaccineBookingModel>.from(
        json.decode(str).map((x) => VaccineBookingModel.fromJson(x)));

String vaccineBookingModelToJson(List<VaccineBookingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VaccineBookingModel {
  int id;
  String parentName;
  String childName;
  String startTime;
  String endTime;
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

  VaccineBookingModel({
    required this.id,
    required this.parentName,
    required this.childName,
    required this.startTime,
    required this.endTime,
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

  factory VaccineBookingModel.fromJson(Map<String, dynamic> json) =>
      VaccineBookingModel(
        id: json["id"],
        parentName: json["parent_name"],
        childName: json["child_name"],
        startTime: json["start_time"],
        endTime: json["end_time"],
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
        "parent_name": parentName,
        "child_name": childName,
        "start_time": startTime,
        "end_time": endTime,
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
