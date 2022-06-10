// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:atalay/model/data_tiles.dart';
import 'package:atalay/pages/map_yonlendirme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../details.dart';

class Liste extends StatefulWidget {
  Liste({Key? key}) : super(key: key);

  @override
  State<Liste> createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  /*
  final List<DataTiles> dataTilesList = [
    DataTiles(
        name: 'Yiğit Atalay',
        color: Colors.red.shade400,
        subtitle: "Kronik Hasta, 24y, A+",
        hareket: false,
        gaz: true,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Çağatay Parlar',
        color: Colors.green,
        subtitle: "Sağlıklı, 17y, 0+",
        hareket: true,
        gaz: true,
        konum: LatLng(41.119775, 028.768304)),
    DataTiles(
        name: 'Özge Şentürk',
        color: Colors.red.shade300,
        subtitle: "Sağlıklı, 35y, A+",
        hareket: true,
        gaz: false,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Bahri Gündoğdu ',
        color: Colors.red.shade700,
        subtitle: "Hasta, 48y, 0+",
        hareket: false,
        gaz: false,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Hüseyin Özgün',
        color: Colors.red.shade500,
        subtitle: "Kronik Hasta, 63y, B+",
        hareket: false,
        gaz: true,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Selin Demir',
        color: Colors.red.shade300,
        subtitle: "Kronik Hasta, 71y, AB-",
        hareket: true,
        gaz: false,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Sezer Çelenk',
        color: Colors.red.shade400,
        subtitle: "Sağlıklı, 50y, 0-",
        hareket: false,
        gaz: true,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Emin Dege',
        color: Colors.red.shade700,
        subtitle: "Hasta, 41, A-",
        hareket: false,
        gaz: false,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Kaan Sümer',
        color: Colors.red.shade300,
        subtitle: "Sağlıklı, 35y, A+",
        hareket: true,
        gaz: false,
        konum: LatLng(41.003710, 29.032128)),
    DataTiles(
        name: 'Zeynep Şerabatır ',
        color: Colors.red.shade700,
        subtitle: "Hasta, 48y, 0+",
        hareket: false,
        gaz: false,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Selin Yatkaya',
        color: Colors.red.shade500,
        subtitle: "Kronik Hasta, 63y, B+",
        hareket: false,
        gaz: true,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Bekir Karagöz',
        color: Colors.red.shade300,
        subtitle: "Kronik Hasta, 71y, AB-",
        hareket: true,
        gaz: false,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Semih Samsun',
        color: Colors.red.shade400,
        subtitle: "Sağlıklı, 50y, 0-",
        hareket: false,
        gaz: true,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Kağan Porsuk',
        color: Colors.red.shade700,
        subtitle: "Hasta, 41, A-",
        hareket: false,
        gaz: false,
        konum: LatLng(41.007710, 29.06528)),
  ];*/

  List<DataTiles> dataTilesList = [];

  skor2(gaz, hareket);

  @override
  void initState() {
    super.initState();
    getListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: ScrollPhysics(parent: null),
        shrinkWrap: true,
        itemBuilder: (listViewContext, int index) {
          return Card(
            //color: dataTilesList[index].color,
            child: ListTile(
              title: Text(dataTilesList[index].name!),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailpage(index),
                      ),
                    );
                  }),
              leading: Icon(Icons.supervised_user_circle),
              subtitle: Text(dataTilesList[index].userid!),
              //selected: index = dataTilesList[index].,
              onTap: () {
                List<String> positions =
                    dataTilesList[index].position!.split(",");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Asil1(
                      focus1: LatLng(double.parse(positions[0]),
                          double.parse(positions[1])),
                      currrentIndex: 1,
                    ),
                  ),
                );
              },
            ),
          );
        },
        itemCount: dataTilesList.length,
      ),
    );
  }

  void getListener() {
    Stream<Event> usersRef =
        FirebaseDatabase.instance.reference().child("Users").onValue;
    usersRef.listen((Event event) {
      Map<String, dynamic> value =
          Map<String, dynamic>.from(event.snapshot.value);
      for (String key in value.keys) {
        DataTiles dataTiles =
            DataTiles.fromJson(Map<String, dynamic>.from(value[key]));
        dataTilesList.add(dataTiles);
      }
      setState(() {});
    });
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/*
class DataTiles {
  DataTiles(
      {required this.color,
      required this.hareket,
      required this.gaz,
      required this.subtitle,
      required this.name,
      required this.konum});
  final String name;
  final Color color;
  final String subtitle;
  final bool gaz;
  final bool hareket;
  final LatLng konum;
  /*void skor2(gaz,hareket){
  int i=0;
  if(gaz){
  color2 = Colors.red.shade400;
  }else if(hareket){
  color = Colors.red.shade600;
  }
  }*/

}*/
/*
ListView(
          children: [
            Container(
              color: Colors.greenAccent,
              child: ListTile(
                leading: Icon(Icons.verified_user),
                title: Text('Yiğit Atalay'),
                subtitle: Text('20C, 0+, Kronik Hasta, 24 Yas'),
                trailing: Icon(Icons.phone),
              ),
            )
          ],


        )
        */
