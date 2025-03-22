// To parse this JSON data, do
//
//     final stockRequestResponseModel = stockRequestResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/model/stock_data.dart';

StockRequestResponseModel stockRequestResponseModelFromJson(String str) =>
    StockRequestResponseModel.fromJson(json.decode(str));

String stockRequestResponseModelToJson(StockRequestResponseModel data) =>
    json.encode(data.toJson());

class StockRequestResponseModel {
  String message;
  StockData data;

  StockRequestResponseModel({
    required this.message,
    required this.data,
  });

  factory StockRequestResponseModel.fromJson(Map<String, dynamic> json) =>
      StockRequestResponseModel(
        message: json["message"],
        data: StockData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}
