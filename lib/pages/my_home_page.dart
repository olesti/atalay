import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displaytext = '';
  String displaytext1 = '';

  int _counter = 0;
  final DatabaseReference _testRef = FirebaseDatabase.instance.reference();
  late StreamSubscription _dailySpecialStream;
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      usersCollectionStream;

  @override
  void initState() {
    super.initState();
    //_activeListener();
  }

  void _activeListener() {
    /*_dailySpecialStream = _testRef.child('1595').onValue.listen((event) {
      var kullname1 = event.snapshot.value.toString();
      print(kullname1.runtimeType);
      List<String> sa2 = kullname1.split(" ");
      String varrs2 = sa2[0];
      String varrs3 = sa2[1];
      String description1 = varrs2+" "+varrs3;
      String description = kullname1;
     setState(() {


       displaytext = description;
       displaytext1 ="";


     });
    });*/
    _dailySpecialStream = _testRef.child("Users/").onValue.listen((event) {
      var kullname1 = event.snapshot.value;
      displaytext = "";
      setState(() {
        for (int i = 0; i < 5; i++) {
          List<String> aaa = kullname1.toString().split("M");
          displaytext += aaa[i];
        }
      });
    });
  }

  void _incrementCounter() {
    _testRef.child('aciklama').set("Hallo MEC423 TDU ${Random().nextInt(100)}");
    setState(() {
      displaytext = '';
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    getListener();
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Text("Connection to Firebase"),
              SizedBox(
                height: 6,
                width: MediaQuery.of(context).size.width,
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text("Write data"),
              ),
              ElevatedButton(
                onPressed: () {
                  final nextOrder = <String, dynamic>{
                    'Connection': getRandom1(),
                    'Humidity': getRandom2(),
                    'Movement': getRandom3(),
                    'Temperature': Random().nextInt(800) / 100.0
                  };
                  _testRef.child('Users').push().set(nextOrder);
                  displaytext = '';
                },
                child: const Text("Create user"),
              ),
              ElevatedButton(
                onPressed: _activeListener,
                child: const Text("Read data"),
              ),

              Text(displaytext),
              Text(displaytext1),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void getListener() {
    try {
      usersCollectionStream = FirebaseFirestore.instance
          .collection("Users")
          .snapshots()
          .listen((event) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot
            in event.docs) {
          displaytext += queryDocumentSnapshot.get("name") + ", ";
          displaytext1 += queryDocumentSnapshot.get("email") + ", ";
        }
      });
    } catch (e) {
      print("hata: " + e.toString());
    }
  }
}

String getRandom1() {
  final baglanti = ['A', 'B'];
  return baglanti[Random().nextInt(baglanti.length)];
}

String getRandom2() {
  final nem = ['44.213', '23.115', '88.75', '12.012'];
  return nem[Random().nextInt(nem.length)];
}

String getRandom3() {
  final hareket = ['true', 'false'];
  return hareket[Random().nextInt(hareket.length)];
}
