// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, must_be_immutable, unnecessary_new

import 'dart:async';
import 'dart:collection';
import 'dart:ffi';

import 'package:atalay/model/data_tiles.dart';
import 'package:atalay/model/pin.dart';
import 'package:atalay/viewmodel/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sms/flutter_sms.dart';

class Mapsa extends StatefulWidget {
  String? userKey;
  Mapsa({Key? key, this.userKey}) : super(key: key);
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

  late PinData _sourcePinInfo;

  late CameraPosition focusCameraPosition;

  List<DataTiles> dataTilesList = [];

  double zoom = 14;

  DataTiles? focusDataTiles;

  GoogleMapController? controller;

  @override
  void initState() {
    super.initState();
    getListener();
    //Ülker Fenerbahçe Şükrü Saracoğlu Stadyumu
    focusCameraPosition = CameraPosition(
        target: const LatLng(40.98820621252252, 29.036891723214072),
        zoom: zoom);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final dailySpecialRef = database.child('/earthquake-a2802-default-rtdbHumidity');
    /*CollectionReference kullaniciref = _firestore.collection('kullanicilar');
    var kullaniciRef = _firestore.collection('kullanicilar').doc('00001');*/
    checkUserKey().then((value) => setState(() {}));
    return Scaffold(
      key: scaffoldKey,
      body: Stack(alignment: Alignment.center, children: [
        GoogleMap(
          //onMapCreated: _onMap1,
          markers: _markers,
          initialCameraPosition: focusCameraPosition,
          onMapCreated: updateCameraPosition,
        ),
      ]),
    );
  }

  Widget getBottomSheet(String s, String s1, String s2, int ss, String s3,
      String s4, String adres, String num, String hum) {
    var vss;
    if (s2 == "null") {
      s2 = "Gesund";
      vss = Icons.health_and_safety;
    } else if (s2 == "Patient") {
      vss = Icons.healing_outlined;
    } else {
      vss = Icons.sick;
    }
    /*
    if (s3 == "true") {
      ss = Colors.green;
      s3 = "Moving";
    } else {
      ss = Colors.red;
      s3 = "Still";
    }*/
    if (s3 == "true") {
      s3 = "Bewegend";
    } else {
      s3 = "Still";
    }
    bool b = s3.toLowerCase() == 'true';
    //int a = hesaplama(s2, s3, double.parse(s4));

    if ((double.parse(hum) < 60 && double.parse(hum) > 40) &&
        (double.parse(s4) <= 28 && double.parse(s4) >= 20)) {
      s4 = "Gute Lebensbedingungen";
    } else {
      s4 = "Schlechte Lebensbedingungen";
    }
    var saa;
    if (ss <= 45 && ss >= 20) {
      saa = const Color.fromARGB(255, 189, 143, 5);
    } else if (ss < 20) {
      saa = Colors.green;
    } else {
      saa = Colors.red;
    }

    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                color: saa,
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
                              //+ " " + ss.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14)),
                          const Icon(
                            Icons.bloodtype,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(s2,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14)),
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14)),
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
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: const Icon(Icons.call),
                        color: Colors.blue,
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(adres);
                        },
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                      Text(adres),
                    ],
                  )),
              SizedBox(
                height: 65,
              )
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Align(
        //     alignment: Alignment.topRight,
        //     child: FloatingActionButton(
        //         child: const Icon(
        //           Icons.navigation,
        //         ),
        //         onPressed: () {}),
        //   ),
        // )
      ],
    );
  }

  void getListener() {
    Stream<Event> usersRef =
        FirebaseDatabase.instance.reference().child("Users").onValue;
    usersRef.listen((Event event) {
      dataTilesList.clear();
      Map<String, dynamic> value =
          Map<String, dynamic>.from(event.snapshot.value);
      for (String key in value.keys) {
        DataTiles dataTiles =
            DataTiles.fromJson(Map<String, dynamic>.from(value[key]));
        dataTilesList.add(dataTiles);
      }

      fillMarkers();
    });
  }

  void fillMarkers() {
    _markers.clear();

    for (DataTiles dataTiles in dataTilesList) {
      List<String> positions = dataTiles.position!.split(",");
      var saa;
      if (dataTiles.color <= 45 && dataTiles.color >= 20) {
        saa = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
      } else if (dataTiles.color < 20) {
        saa = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
      } else {
        saa = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
      }
      _markers.add(Marker(
          markerId: MarkerId(dataTiles.userid!),
          icon: saa,
          position:
              LatLng(double.parse(positions[0]), double.parse(positions[1])),
          onTap: () {
            markerTap(
                dataTiles.address!,
                dataTiles.name!,
                dataTiles.blood!,
                dataTiles.disease!,
                dataTiles.movement!,
                dataTiles.temperature!,
                dataTiles.color,
                dataTiles.humidity!);
          }));
    }
    setState(() {});
  }

  Future checkUserKey() async {
    UserModel userModel = Provider.of<UserModel>(context, listen: false);
    if (userModel.focusDataTiles != null) {
      focusDataTiles = userModel.focusDataTiles;
      userModel.focusDataTiles = null;
      print("name: " + focusDataTiles!.name!);
      getFocus();
    }
  }

  Future getFocus() async {
    List<String> positions = focusDataTiles!.position!.split(",");
    await Future.delayed(const Duration(milliseconds: 400));
    controller!.moveCamera(CameraUpdate.newLatLngZoom(
        LatLng(double.parse(positions[0]), double.parse(positions[1])), 16));
    markerTap(
        focusDataTiles!.address!,
        focusDataTiles!.name!,
        focusDataTiles!.blood!,
        focusDataTiles!.disease!,
        focusDataTiles!.movement!,
        focusDataTiles!.temperature!,
        focusDataTiles!.color,
        focusDataTiles!.humidity!);
  }

  Future markerTap(String address, String name, String blood, String disease,
      String movement, double temperature, int color, String huminity) async {
    await Future.delayed(const Duration(milliseconds: 400));
    scaffoldKey.currentState!.showBottomSheet((context) => Container(
          child: getBottomSheet(name, blood, disease, color, movement,
              temperature.toString(), address, "05387423541", huminity),
          height: 250,
          color: Colors.black,
        ));
  }

  void updateCameraPosition(GoogleMapController googleMapController) {
    controller = googleMapController;
  }
}
