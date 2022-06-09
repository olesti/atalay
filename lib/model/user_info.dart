import 'package:flutter/cupertino.dart';

class UserInfoC {
  String? id;
  String? email;
  String? name;
  String? password;
  String? serialNumber;
  bool admin = false;

  UserInfoC(
      {this.id,
      @required this.email,
      this.name,
      this.password,
      this.serialNumber,
      required this.admin});

  UserInfoC.fromJson(Map<String, Object?> json)
      : this(
            id: json["id"]! as String,
            name: json["name"]! as String,
            email: json["email"]! as String,
            serialNumber: json["serialNumber"]! as String,
            admin: json["admin"] as bool);

  Map<String, Object?> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "serialNumber": serialNumber,
        "admin": admin
      };
}
