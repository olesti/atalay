import 'package:flutter/cupertino.dart';

class UserInfoC {
  String? id;
  String? email;
  String? name;
  String? password;
  String? serialNumber;

  UserInfoC(
      {this.id,
      @required this.email,
      this.name,
      this.password,
      this.serialNumber});

  UserInfoC.fromJson(Map<String, Object?> json)
      : this(
            id: json["id"]! as String,
            name: json["name"]! as String,
            email: json["email"]! as String,
            serialNumber: json["serialNumber"]! as String);

  Map<String, Object?> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "serialNumber": serialNumber
      };
}
