// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int id;
  String name;
  String email;
  String password;
  String providerType;
  String address;
  String phone;
  String latitude;
  String longitude;
  List<int> vaccines;
  int nextDayBookingCount;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.providerType,
    required this.address,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.vaccines,
    required this.nextDayBookingCount,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        providerType: json["provider_type"],
        address: json["address"],
        phone: json["phone"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        vaccines: List<int>.from(json["vaccines"].map((x) => x)),
        nextDayBookingCount: json["next_day_booking_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "provider_type": providerType,
        "address": address,
        "phone": phone,
        "latitude": latitude,
        "longitude": longitude,
        "vaccines": List<dynamic>.from(vaccines.map((x) => x)),
        "next_day_booking_count": nextDayBookingCount,
      };
}
