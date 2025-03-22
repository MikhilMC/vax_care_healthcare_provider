// To parse this JSON data, do
//
//     final stockData = stockDataFromJson(jsonString);

import 'dart:convert';

StockData stockDataFromJson(String str) => StockData.fromJson(json.decode(str));

String stockDataToJson(StockData data) => json.encode(data.toJson());

class StockData {
  int id;
  int healthProvider;
  List<int> vaccineIds;
  String ageGroup;
  int quantity;
  String status;
  DateTime createdAt;

  StockData({
    required this.id,
    required this.healthProvider,
    required this.vaccineIds,
    required this.ageGroup,
    required this.quantity,
    required this.status,
    required this.createdAt,
  });

  factory StockData.fromJson(Map<String, dynamic> json) => StockData(
        id: json["id"],
        healthProvider: json["health_provider"],
        vaccineIds: List<int>.from(json["vaccine_ids"].map((x) => x)),
        ageGroup: json["age_group"],
        quantity: json["quantity"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "health_provider": healthProvider,
        "vaccine_ids": List<dynamic>.from(vaccineIds.map((x) => x)),
        "age_group": ageGroup,
        "quantity": quantity,
        "status": status,
        "created_at": createdAt.toIso8601String(),
      };
}
