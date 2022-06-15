import 'package:atalay/pages/dat.dart';
import 'package:atalay/pages/listeekrani.dart';
import 'package:atalay/pages/maps_seite.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'liromipos.dart';

class Asil extends StatefulWidget {
  Asil({Key? key, this.focus1, this.currrentIndex}) : super(key: key);
  int? currrentIndex;
  LatLng? focus1;
  @override
  _AsilState createState() => _AsilState();
}

class _AsilState extends State<Asil> {
  LatLng? focus1;
  int currentIndex = 0;
  List<Widget> screen = [
    //OpenContainerTransformDemo(),
    //OpenContainerTransformDemo(),
    const name(),
    Mapsa(),
  ];
  GlobalKey globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    screen.add(Liste(globalKey: globalKey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          key: globalKey,
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
