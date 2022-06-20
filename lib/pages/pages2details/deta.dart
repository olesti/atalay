// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:atalay/pages/dat.dart';
import 'package:atalay/pages/pages2details/dsas.dart';
import 'package:flutter/material.dart';

class Asall extends StatelessWidget {
  const Asall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: name2(),
      /*
        Container(
            margin: EdgeInsets.fromLTRB(345, 0, 0, 60),
            width: 50,
            height: 50,
            color: Color.fromARGB(255, 18, 88, 240),
            child: Center(
                child: IconButton(
                    icon: Icon(
                      Icons.exit_to_app,
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => name()))))));*/
    );
  }
}

class name2 extends StatelessWidget {
  name2({Key? key}) : super(key: key);
  String sa =
      "Der Bau erdbebenfester Gebäude hat in einigen Ländern große Fortschritte gemacht. Es ist wahrscheinlich, dass Wohnhäuser und Hochhäuser mit einem Stahlrahmen, die in den letzten Jahren gebaut wurden, auch bei einem starken Erdbeben intakt bleiben. \n- Löschen Sie offenes Feuer und stellen Sie Gashähne ab. \n -Schützen Sie Ihren Kopf vor herabfallenden Gegenständen und Zerspringenden Fensterscheiben indem Sie unter einen stabilen Tisch kriechen und sich nicht in direkter Linie zum Fenster befinden. \n Begeben Sie sich in die Nähe des Notausganges. \n Öffnen Sie die Tür und/oder Fenster zum Fluchtweg, damit diese sich nicht verklemmen können. \n Je kleiner der Raum, desto stabiler ist die Decke. Relativ sicher sind Sie meist unter einem Türrahmen. Achten Sie auf Schränke und schwere Gegenstände in Ihrer Nähe. Flüchten Sie nicht in Panik auf die Straße, da Sie dort durch herabfallende Trümmer und Glassplitter stärker gefährdet sind als im Gebäude. Benutzen Sie keine Aufzüge. Wenn Sie sich in einem befinden, öffnet sich dieser vermutlich automatisch in der nächsten Etage. Ansonsten drücken Sie alle Knöpfe, bewahren Sie Ruhe und benutzen Sie die Sprechanlage. Gehen Sie in Treppenhäusern nach unten und nicht in Richtung Dach. Klären Sie zusammen mit Nachbarn die Lage und sehen Sie nach, ob noch Personen in Fahrstühlen eingeschlossen sind. Bekämpfen Sie den Brand und speichern Sie vorsorglich Wasser in Badewannen und Eimern. Beobachten Sie Ihre Umgebung auf Großfeuer. Sollte sich ein Brand nähern oder Ihr Haus unbewohnbar sein, begeben Sie sich zu einem Sammelplatz. Wenn Sie in einem Kaufhaus, Kino, Theater oder in Zügen sind, folgen Sie den Anweisungen des Personals, das für solche Situationen geschult ist. Bleiben Sie ruhig. Eine Panik wäre gefährlicher als das Erdbeben selbst. b) Auf der Straße - Besondere Gefahren können sich durch freiliegende Stromleitungen ergeben. Auch Tunnel, Brücken sowie Straßenunter- und Überführungen sollten gemieden werden. - Schützen Sie Ihren Kopf mit einem Helm, einer Tasche oder anderen Gegenständen. - Begeben Sie sich auf Freiflächen oder in Hauseingänge. Nehmen Sie sich in Acht vor herabfallenden Trümmern, Glassplittern und Lichtreklamen. Halten Sie Abstand zu Getränkeautomaten, Mauern, Masten und zerrissenen Leitungen. ";
  @override
  Widget build(BuildContext context) {
    /*return SizedBox(
      height: 1000,
      child: Stack(
        children: [
          Expanded(
            flex: 1,
            child: new Positioned(
                top: 45,
                left: 20,
                child: Card(
                  child: Column(children: [
                    Text(
                      "Deprem Öncesi Hazırlıklar",
                      style: TextStyle(
                          fontSize: 19,
                          color: Color(0xFF363f93),
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Text(
                      sa,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ]),
                )),
          ),
          new Container(
              margin: EdgeInsets.fromLTRB(345, 0, 0, 60),
              width: 50,
              height: 50,
              color: Color.fromARGB(255, 18, 88, 240),
              child: Center(
                  child: IconButton(
                      icon: Icon(
                        Icons.exit_to_app,
                      ),
                      onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => name())))))
        ],
      ),
    );*/
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            Flexible(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                        ),
                        color: Color(0xFF363f93),
                      ),
                      child: Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(345, 30, 0, 60),
                              width: 50,
                              height: 50,
                              color: Color.fromARGB(0, 18, 88, 240),
                              child: Center(
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.exit_to_app,
                                      ),
                                      onPressed: () => Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  name()))))),
                          Positioned(
                              top: 80,
                              left: 0,
                              child: Container(
                                height: 70,
                                width: 300,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(50))),
                              )),
                          Positioned(
                              top: 90,
                              left: 20,
                              child: Text("Vorbereitungen vor dem \nErdbeben",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 4, 118, 194))))
                        ],
                      ),
                    ),
                    Text(sa),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      itemCount: 1,
    ));
  }
}
