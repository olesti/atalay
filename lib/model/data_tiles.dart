class DataTiles {
  String? blood;
  String? connection;
  String? disease;
  String? humidity;
  String? movement;
  String? name;
  String? position;
  double? temperature;
  String? userid;

  DataTiles(
      {this.blood,
      this.connection,
      this.disease,
      this.humidity,
      this.movement,
      this.name,
      this.position,
      this.temperature,
      this.userid});

  DataTiles.fromJson(Map<String, Object?> json)
      : this(
            blood: json["Blood"] as String,
            connection: json["Connection"] as String,
            disease: json["Disease"] as String,
            humidity: json["Humidity"] as String,
            movement: json["Movement"] as String,
            name: json["Name"] as String,
            position: json["Position"] as String,
            temperature: json["Temperature"] as double,
            userid: json["userid"] as String);

  Map<String, Object?> toJson() => {
        "Blood": blood,
        "Connection": connection,
        "Disease": disease,
        "Humidity": humidity,
        "Movement": movement,
        "Name": name,
        "Position": position,
        "Temperature": temperature,
        "userid": userid
      };
}