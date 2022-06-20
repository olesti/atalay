// @dart=2.9

import 'package:atalay/constants.dart';
// ignore_for_file: prefer_const_constructors, unused_import

import 'package:atalay/kayitekranlari/profile_screem.dart';
import 'package:atalay/locator.dart';
import 'package:atalay/pages/bilgiekrani.dart';
import 'package:atalay/pages/listeekrani.dart';
import 'package:atalay/pages/loading.dart';
import 'package:atalay/pages/login.dart';
import 'package:atalay/pages/map_yonlendirme.dart';
import 'package:atalay/pages/maps_seite.dart';
import 'package:atalay/pages/mapsyeni.dart';
import 'package:atalay/pages/saaa.dart';
import 'package:atalay/viewmodel/user_model.dart';
import 'package:atalay/yeni.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/landing_page.dart';
import 'screensto/login_screen.dart';

/*

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Umut Kolyesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Umut Kolyesi'),
    );
  }
}
*/
/*
void main() {
  runApp( MyHome() );
}
class MyHome extends StatefulWidget {
  const MyHome({Key key, this.title}) : super(key: key);

  final String title;

  
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentIndex = 0;
  final screen = [
    Bilgi(),
    const Mapsa(),
    Liste(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sa"),
      ),
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
}*/

//son
void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyHome());
}

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
          fontFamily: "MetaPro",
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        //home: Kayitekrani(),
        home: Bilgi(),
      ),
    );
  }
}
