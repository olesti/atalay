// ignore_for_file: no_logic_in_create_state, unnecessary_this, must_be_immutable

import 'dart:convert';

import 'package:atalay/pages/dat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:atalay/pages/bilgiekrani.dart';
import 'package:atalay/pages/listeekrani.dart';
import 'package:atalay/pages/maps_seite.dart';
import 'package:atalay/pages/loading.dart';
import 'package:atalay/pages/mapsyeni.dart';
import 'package:atalay/pages/saaa.dart';

import '../liromipos.dart';
import 'map_onikibes.dart';

class Asil1 extends StatefulWidget {
  Asil1({Key? key, required this.focus1, required this.currrentIndex})
      : super(key: key);
  int currrentIndex;
  final LatLng focus1;

  @override
  _Asil1State createState() =>
      _Asil1State(focus1: this.focus1, currentIndex: this.currrentIndex);
}

class _Asil1State extends State<Asil1> {
  LatLng focus1;
  _Asil1State({required this.focus1, required this.currentIndex});
  int currentIndex = 0;

  /* void initState() {
    super.initState();
    focus2 = widget.focus1;
  }*/
  final screen = [
    //OpenContainerTransformDemo(),
    //OpenContainerTransformDemo(),
    //Mapsa1(focus: const LatLng(0, 0),),
    name(),
    Mapsa(focus: const LatLng(0, 0)),
    Liste(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        //body: screen[currentIndex],
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
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
              color: Colors.red,
            ),
            label: 'List',
            backgroundColor: Colors.blueGrey,
          ),
        ],
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
