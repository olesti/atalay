import 'package:flutter/material.dart';

class DataTiles {
  String? address;
  String? blood;
  String? connection;
  String? disease;
  String? humidity;
  String? movement;
  String? name;
  String? position;
  double? temperature;
  String? userid;
  int color;

  DataTiles(
      {this.address,
      this.blood,
      this.connection,
      this.disease,
      this.humidity,
      this.movement,
      this.name,
      this.position,
      this.temperature,
      this.userid,
      required this.color});

  DataTiles.fromJson(Map<String, Object?> json)
      : this(
            address: json["Address"] as String,
            blood: json["Blood"] as String,
            connection: json["Connection"] as String,
            disease: json["Disease"] as String,
            humidity: json["Humidity"] as String,
            movement: json["Movement"] as String,
            name: json["Name"] as String,
            position: json["Position"] as String,
            temperature: json["Temperature"] as double,
            userid: json["userid"] as String,
            color: hesaplama(json["Disease"] as String,
                json["Movement"] as String, json["Temperature"] as double));

  Map<String, Object?> toJson() => {
        "Address": address,
        "Blood": blood,
        "Connection": connection,
        "Disease": disease,
        "Humidity": humidity,
        "Movement": movement,
        "Name": name,
        "Position": position,
        "Temperature": temperature,
        "userid": userid,
        "Color": color
      };

  @override
  String toString() {
    return 'DataTiles{blood: $blood, connection: $connection, disease: $disease, humidity: $humidity, movement: $movement, name: $name, position: $position, temperature: $temperature, userid: $userid, color: $color}';
  }
}

int sad(String a) {
  if (a == "true") {
    return 1;
  }
  return 2;
}

int hesaplama(String b, String c, double s4) {
  var s5;
  s5 = s4;
  int point = 0;
  if (c == "false") {
    point += 50;
  }
  if (b == "Kronik Hasta") {
    point += 30;
  }
  if (b == "Hasta") {
    point += 15;
  }
  if (s5 <= 17) {
    point += 10;
  }
  if (s5 >= 30) {
    point += 5;
  }
  return point;
}
