// ignore_for_file: no_logic_in_create_state, unnecessary_this, must_be_immutable

//import 'dart:html';

import 'package:atalay/pages/dat.dart';
import 'package:atalay/pages/listeekrani.dart';
import 'package:atalay/pages/maps_seite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Asil1 extends StatefulWidget {
  Asil1({Key? key, this.focus1, this.currrentIndex}) : super(key: key);
  int? currrentIndex;
  LatLng? focus1;

  @override
  _Asil1State createState() => _Asil1State();
}

class _Asil1State extends State<Asil1> {
  LatLng? focus1;
  int currentIndex = 0;

  /* void initState() {
    super.initState();
    focus2 = widget.focus1;
  }*/
  List<Widget> screen = [
    //OpenContainerTransformDemo(),
    //OpenContainerTransformDemo(),
    //Mapsa1(focus: const LatLng(0, 0),),
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

        //body: screen[currentIndex],
        body: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.amberAccent,
        key: globalKey,
        items: const <BottomNavigationBarItem>[
          //type: BottomNavigationBarType.shifting,
          //currentIndex: currentIndex,
          // onTap: (index) => setState(() => currentIndex = index),

          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.map),
            label: 'Map',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.list_dash,
            ),
            label: 'List',
            backgroundColor: Colors.yellow,
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return screen[index];
          },
        );
      },
    ));
  }
}
