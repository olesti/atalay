import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  String name;
  double temp;
  String blood;
  String pos;
  String mov;
  String tel;
  String hum;
  String con;
  int color;
  String has;

  Detailpage(this.name, this.temp, this.blood, this.pos, this.mov, this.tel,
      this.hum, this.con, this.color, this.has);
  @override
  Widget build(BuildContext context) {
    if (con == "A") {
      con = "Keine Verbindung mit Satellite";
    } else {
      con = "erfolgreich Verbindung";
    }
    if (mov == "true") {
      mov = "Bewegend";
    } else {
      mov = "Still";
    }
    var colors;
    if (color <= 45 && color >= 20) {
      colors = Color.fromARGB(255, 189, 143, 5);
    } else if (color < 20) {
      colors = Colors.green;
    } else {
      colors = Colors.red;
    }
    if (has == "null") {
      has = "Gesund";
    }
    var pos1 = pos.split(",");
    pos1[0];
    pos1[1];
    var pos2 = pos1[0].substring(0, 6);
    var pos3 = pos1[1].substring(0, 6);
    /*vss = Icons.health_and_safety;
    } else if (has == "Patient") {
      vss = Icons.healing_outlined;
    } else {
      vss = Icons.sick;
    }*/
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: colors,
      ),
      body: Builder(builder: (context) {
        return Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  const Text(
                      " Name:\n\n Temperature:\n\n Hastalık:\n\n Blood:\n\n Pos:\n\n Movement:\n\n Telefonnumer:\n\n Huminity:\n\n Connection:",
                      style: TextStyle(
                        fontFamily: "MetaPro",
                        fontSize: 19.0,
                        wordSpacing: 2,
                      )),
                  Text(
                      " $name \n\n $temp° \n\n $has \n\n $blood \n\n $pos2"
                      ","
                      "$pos3 \n\n $mov \n\n $tel \n\n $hum  \n\n $con",
                      style: const TextStyle(
                        fontFamily: "MetaPro",
                        fontSize: 19.0,
                        wordSpacing: 2,
                      ))
                ],
              )

              /* Text(
                "Name:  $name ",
                style: const TextStyle(fontSize: 19),
              ),
              SizedBox(height: 12),
              Text("Temperature:  $temp ", style: const TextStyle(fontSize: 19),*/
            ],
          ),
        );
      }),
    );
  }
}
