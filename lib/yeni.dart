import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:atalay/pages/bilgiekrani.dart';
import 'package:atalay/pages/listeekrani.dart';
import 'package:atalay/pages/maps_seite.dart';
import 'package:atalay/pages/loading.dart';
import 'package:atalay/pages/mapsyeni.dart';
import 'package:atalay/pages/saaa.dart';

import 'info.dart';
import 'liromipos.dart';

class Asil extends StatefulWidget {
  Asil({Key? key}) : super(key: key);
  int currrentIndex = 0;

  @override
  _AsilState createState() => _AsilState();
}

class _AsilState extends State<Asil> {
  int currentIndex = 0;
  final screen = [
    OpenContainerTransformDemo(),
    //OpenContainerTransformDemo(),
    Mapsa(focus: LatLng(41.007710, 29.06528)),
    Liste(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black26,
          type: BottomNavigationBarType.shifting,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'list',
              backgroundColor: Colors.blueGrey,
            )
          ]),
    );
  }
}
