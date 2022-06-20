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

  Detailpage(this.name, this.temp, this.blood, this.pos, this.mov, this.tel,
      this.hum, this.con);
  @override
  Widget build(BuildContext context) {
    if (con == "A") {
      con = "Keine Verbindung mit Satellit";
    } else {
      con = "Verbindung mit Satellit erfolgreich";
    }
    if (mov == "true") {
      mov = "Moving";
    } else {
      mov = "Still";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("$name"),
      ),
      body: Builder(builder: (context) {
        return Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                  " Name:  $name \n\n Temperature:  $temp°  \n\n Blood:  $blood \n\n Pos:  $pos \n\n Movement:  $mov  \n\n Telefonnumer:  $tel \n\n Huminity:  $hum \n\n Connection:  $con",
                  style: const TextStyle(
                    fontFamily: "MetaPro",
                    fontSize: 19.0,
                    wordSpacing: 2,
                  )),
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
