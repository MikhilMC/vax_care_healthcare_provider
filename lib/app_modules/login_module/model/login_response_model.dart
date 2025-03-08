// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  String status;
  String message;
  int user;
  String name;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.user,
    required this.name,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        message: json["message"],
        user: json["user"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user,
        "name": name,
      };
}
