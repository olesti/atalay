// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_new

import 'dart:async';
import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:atalay/model/pin.dart';

/*
class Mapsa extends StatefulWidget {
  Mapsa({Key? key, required this.focus}) : super(key: key);
  LatLng focus;
  @override
  _MapsaState createState() => _MapsaState();
  final formKey = new GlobalKey<FormState>();
}

class _MapsaState extends State<Mapsa> {
  late BitmapDescriptor sourceIcon;
  void setPin() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0),
        "assets/images/person.png");
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _markers = HashSet<Marker>();
  var cagatayLoc;
  var username1;
  var kullname2;
  var kullname3;
  var yigo;
  late String adresse1 = "Yeni mah. 3130.sokak göktürk apartmanı no.7 ";
  late String adresse2 = "İçerenköy mah. Erdem sokak no.6 ";
  late String adresse3 = "Kavacık mah. Ezine sokak no.22  ";
  /*void kullname() {
    final DatabaseReference _testRef = FirebaseDatabase.instance.reference();
    late StreamSubscription _dailySpecialStream;
    _dailySpecialStream = _testRef.child('1595/Name').onValue.listen((event) {
    String  kullname1 = event.snapshot.value;
    });
  }*/

  late PinData _sourcePinInfo;
  void _onMap(GoogleMapController mycontroller) {
    final DatabaseReference _testRef = FirebaseDatabase.instance.reference();
    late StreamSubscription _dailySpecialStream;
    late StreamSubscription _dailySpecialStream1;
    late StreamSubscription _dailySpecialStream2;
    _dailySpecialStream = _testRef.child('Position').onValue.listen((event) {
      final String sa = event.snapshot.value;
      List<String> sa1 = sa.split(",");
      // sa1[0];
      // sa1[1];
      double varrs = double.parse(sa1[0]);
      double varrs1 = double.parse(sa1[1]);
      var cagatayLoc = LatLng(varrs, varrs1);

      _dailySpecialStream2 = _testRef.child('1658').onValue.listen((event) {
        //final Map<String, dynamic> sa1 = event.snapshot.value;
        final Map<String, dynamic> sa1 = Map<String, dynamic>.from(event
            .snapshot
            .value); /*

      List<String> sa2 = sa.split(",");
      double varrs2 = double.parse(sa1[0]);
      double varrs3 = double.parse(sa1[1]);
      */
        //var yigo = LatLng(varrs2, varrs3);
      });
      // sa1[0];
      // sa1[1];

      _dailySpecialStream1 =
          _testRef.child('1595/Name').onValue.listen((event) {
        String username1 = event.snapshot.value;
        /*
        List<String> sa2 = kullname1.split(" ");
        String varrs2 = sa2[0];
        String varrs3 = sa2[1];*/

        setState(() {
          _markers.add(
            Marker(
                markerId: MarkerId('id-1'),
                position: LatLng(41.003710, 29.032128),
                onTap: () {
                  var bottomSheetController1 = scaffoldKey.currentState!
                      .showBottomSheet((context) => Container(
                            child: getBottomSheet(
                                "Kaan Sümer",
                                "AB rh-",
                                "Sağlıklı",
                                Colors.green,
                                "Hareket Var",
                                "Ortam Koşulları İyi",
                                adresse3,
                                "05387423541"),
                            height: 250,
                            color: Colors.transparent,
                          ));
                }),
          );
          _markers.add(
            Marker(
                markerId: const MarkerId('id-2'),
                position: LatLng(41.007710, 29.06528),
                onTap: () {
                  var bottomSheetController1 = scaffoldKey.currentState!
                      .showBottomSheet((context) => Container(
                            child: getBottomSheet(
                                "Yiğit Atalay",
                                "0 rh+",
                                "Kronik Hasta",
                                Colors.green.shade200,
                                "Hareket Var",
                                "Ortam Koşulları İyi",
                                adresse2,
                                "05443042496"),
                            height: 250,
                            color: Colors.transparent,
                          ));
                }),
          );
          _markers.add(
            Marker(
                icon: BitmapDescriptor.defaultMarkerWithHue(0.01),
                markerId: const MarkerId('id-3'),
                position: cagatayLoc,
                onTap: () {
                  hesaplama(65, "Hasta", true);
                  var bottomSheetController1 = scaffoldKey.currentState!
                      .showBottomSheet((context) => Container(
                            child: getBottomSheet(
                                username1,
                                "A rh+",
                                "Sağlıklı",
                                Colors.red.shade500,
                                "Hareket Yok",
                                "Ortam Koşulları Kötü",
                                adresse1,
                                "05415821244"),
                            height: 250,
                            color: Colors.transparent,
                          ));
                }),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.focus == const LatLng(0, 0)) {
      widget.focus = const LatLng(41.003710, 29.032128);
    }
    //final dailySpecialRef = database.child('/earthquake-a2802-default-rtdbHumidity');
    /*CollectionReference kullaniciref = _firestore.collection('kullanicilar');
    var kullaniciRef = _firestore.collection('kullanicilar').doc('00001');*/
    return Scaffold(
      key: scaffoldKey,
      body: Stack(alignment: Alignment.center, children: [
        GoogleMap(
          onMapCreated: _onMap,
          markers: _markers,
          initialCameraPosition: CameraPosition(target: widget.focus, zoom: 11),
        ),
      ]),
    );
  }

  Widget getBottomSheet(String s, String s1, String s2, Color ss, String s3,
      String s4, String adres, String num) {
    var vss;
    if (s2 == "Sağlıklı") {
      vss = Icons.health_and_safety;
    } else {
      vss = Icons.sick;
    }
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                color: ss,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        s,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(s1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          Icon(
                            Icons.bloodtype,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(s2,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          Icon(
                            vss,
                            color: Colors.purple,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(s3,
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.air,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(s4)
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.home_work_rounded,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(adres)
                    ],
                  )),
              const SizedBox(
                height: 0,
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(Icons.call),
                        color: Colors.blue,
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(num);
                        },
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                      Text(num),
                    ],
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
                child: Icon(
                  Icons.navigation,
                ),
                onPressed: () {}),
          ),
        )
      ],
    );
  }
}*/
class Mapsa1 extends StatefulWidget {
  Mapsa1({Key? key, required this.focus}) : super(key: key);
  LatLng focus;
  @override
  _Mapsa1State createState() => _Mapsa1State();
  final formKey = new GlobalKey<FormState>();
}

class _Mapsa1State extends State<Mapsa1> {
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor customIcon;
  void setPin() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.0),
        "assets/images/person.png");
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _markers = HashSet<Marker>();
  late BitmapDescriptor mapMarker;
  var cagatayLoc;
  var username1;
  var kullname2;
  var kullname3;
  var yigo;
  late String adresse1 = "Yeni mah. 3130.sokak göktürk apartmanı no.7 ";
  late String adresse2 = "İçerenköy mah. Erdem sokak no.6 ";
  late String adresse3 = "Kavacık mah. Ezine sokak no.22  ";
  /*void kullname() {
    final DatabaseReference _testRef = FirebaseDatabase.instance.reference();
    late StreamSubscription _dailySpecialStream;
    _dailySpecialStream = _testRef.child('1595/Name').onValue.listen((event) {
    String  kullname1 = event.snapshot.value;
    });
  }*/

  late PinData _sourcePinInfo;
  void _onMap(GoogleMapController mycontroller) {
    final DatabaseReference _testRef = FirebaseDatabase.instance.reference();
    late StreamSubscription _dailySpecialStream;
    late StreamSubscription _dailySpecialStream1;
    late StreamSubscription _dailySpecialStream2;
    _dailySpecialStream = _testRef.child('Position').onValue.listen((event) {
      final String sa = event.snapshot.value;
      List<String> sa1 = sa.split(",");
      // sa1[0];
      // sa1[1];
      double varrs = double.parse(sa1[0]);
      double varrs1 = double.parse(sa1[1]);
      var cagatayLoc = LatLng(varrs, varrs1);

      _dailySpecialStream2 = _testRef.child('1658').onValue.listen((event) {
        //final Map<String, dynamic> sa1 = event.snapshot.value;
        final Map<String, dynamic> sa1 = Map<String, dynamic>.from(event
            .snapshot
            .value); /*

      List<String> sa2 = sa.split(",");
      double varrs2 = double.parse(sa1[0]);
      double varrs3 = double.parse(sa1[1]);
      */
        //var yigo = LatLng(varrs2, varrs3);
      });
      // sa1[0];
      // sa1[1];

      _dailySpecialStream1 =
          _testRef.child('1595/Name').onValue.listen((event) {
        String username1 = event.snapshot.value;
        /*
        List<String> sa2 = kullname1.split(" ");
        String varrs2 = sa2[0];
        String varrs3 = sa2[1];*/

        setState(() {
          _markers.add(
            // ignore: prefer_const_constructors
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(330),
              markerId: const MarkerId('id-1'),
              position: const LatLng(41.003710, 29.032128),
            ),
          );
          _markers.add(
            // ignore: prefer_const_constructors
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(330),
              markerId: const MarkerId('id-11'),
              position: const LatLng(41.019719, 29.99999),
            ),
          );
          _markers.add(
            // ignore: prefer_const_constructors
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(330),
              markerId: const MarkerId('id-12'),
              position: const LatLng(41.081710, 28.03228),
            ),
          );
          _markers.add(
            // ignore: prefer_const_constructors
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(330),
              markerId: const MarkerId('id-13'),
              position: const LatLng(41.103710, 29.432128),
            ),
          );
          _markers.add(
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(330),
              markerId: const MarkerId('id-22'),
              position: const LatLng(41.107719, 28.79528),
            ),
          );
          _markers.add(
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(330),
              markerId: const MarkerId('id-32'),
              position: const LatLng(41.007710, 29.06528),
            ),
          );
          _markers.add(
            Marker(
              icon: BitmapDescriptor.defaultMarkerWithHue(330),
              markerId: const MarkerId('id-2'),
              position: const LatLng(41.007710, 29.19528),
            ),
          );
          _markers.add(Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(330),
            markerId: const MarkerId('id-3'),
            position: const LatLng(41.107719, 28.24528),
          ));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.focus == const LatLng(0, 0)) {
      widget.focus = const LatLng(41.003710, 29.032128);
    }
    //final dailySpecialRef = database.child('/earthquake-a2802-default-rtdbHumidity');
    /*CollectionReference kullaniciref = _firestore.collection('kullanicilar');
    var kullaniciRef = _firestore.collection('kullanicilar').doc('00001');*/
    return Scaffold(
      key: scaffoldKey,
      body: Stack(alignment: Alignment.center, children: [
        GoogleMap(
          onMapCreated: _onMap,
          markers: _markers,
          initialCameraPosition: CameraPosition(target: widget.focus, zoom: 11),
        ),
      ]),
    );
  }
}
