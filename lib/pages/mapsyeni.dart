// ignore_for_file: unused_field, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:atalay/model/pin.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

class GetUserName extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final String documentId;

  GetUserName(this.documentId, {Key? key}) : super(key: key);
  @override
  /*void initState() {
    super.initState();
    var _ref=FirebaseDatabase.instance.reference().child('Users').orderByChild('Blood');
  }*/
  final _markers = HashSet<Marker>();
  var caga;
  var kullname1;
  var kullname2;
  var kullname3;
  /*void kullname() {
    final DatabaseReference _testRef = FirebaseDatabase.instance.reference();
    late StreamSubscription _dailySpecialStream;
    _dailySpecialStream = _testRef.child('1595/Name').onValue.listen((event) {
    String  kullname1 = event.snapshot.value;
    });
  }*/
/*
  late PinData _sourcePinInfo;
  void _onMap(GoogleMapController mycontroller) {
    
   
      setState(() {
        _markers.add(
           Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(41.003710, 29.032128),
            infoWindow: InfoWindow(
              title: '$kullname2',
            ),
          ),
        );
        String saaaa = kullname2;
        _markers.add(
          Marker(
            markerId: const MarkerId('id-2'),
            position: caga,
            infoWindow: InfoWindow(
                title: '$kullname2',
                
            ),
            onTap: () {
                  var bottomSheetController = scaffoldKey.currentState!
                      .showBottomSheet((context) => Container(
                            child: getBottomSheet(kullname2),
                            height: 250,
                            color: Colors.transparent,
                          ));
                }
                ),
                
            
        );
        _markers.add(
           Marker(
            markerId: const MarkerId('id-3'),
            position: LatLng(41.007710, 29.06528),
            
            onTap: () {
                  var bottomSheetController1 = scaffoldKey.currentState!
                      .showBottomSheet((context) => Container(
                            child: getBottomSheet(kullname1),
                            height: 250,
                            color: Colors.transparent,
                          ));
                }
          ),
        );
      });
   
  }

  @override
  Widget build(BuildContext context) {
    //final dailySpecialRef = database.child('/earthquake-a2802-default-rtdbHumidity');
    /*CollectionReference kullaniciref = _firestore.collection('kullanicilar');
    var kullaniciRef = _firestore.collection('kullanicilar').doc('00001');*/
    return Scaffold(
      key: scaffoldKey,
      body: Stack(alignment: Alignment.center, children: [
        GoogleMap(
          onMapCreated: _onMap,
          markers: _markers,
          initialCameraPosition: const CameraPosition(
              target: LatLng(41.003710, 29.032128), zoom: 11),
        ),
      ]),
    );
  }

  Widget getBottomSheet(String s) {
    
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$s",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const <Widget>[
                          Text("4.5",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("970 Folowers",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Memorial Park",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.map,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("$s")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        color: Colors.blue,
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(
                              "05443042496");
                        },
                        icon: Icon(Icons.call),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("05443042496")
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
                child: Icon(Icons.navigation), onPressed: () {}),
          ),
        )
      ],
    );
  }
  */
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
