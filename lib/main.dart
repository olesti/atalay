// @dart=2.9

// ignore_for_file: prefer_const_constructors, unused_import

import 'package:atalay/kayitekranlari/profile_screem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:atalay/constants.dart';
import 'package:atalay/pages/bilgiekrani.dart';
import 'package:atalay/pages/listeekrani.dart';
import 'package:atalay/pages/login.dart';
import 'package:atalay/pages/map_yonlendirme.dart';
import 'package:atalay/pages/maps_seite.dart';
import 'package:atalay/pages/loading.dart';
import 'package:atalay/pages/mapsyeni.dart';
import 'package:atalay/pages/saaa.dart';
import 'package:atalay/yeni.dart';
import 'screensto/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: Kayitekrani(),
      home: Asil1(),
    );
  }
}
/*
void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Loginscreen();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  static Future<User> loginUsingEmailPassword(
      {String email, String password, BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailcontrol = TextEditingController();
    TextEditingController _passwordcontrol = TextEditingController();
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Umut Kolyesi",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 44.0),
          TextField(
            controller: _emailcontrol,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "User Email",
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.blueAccent,
                )),
          ),
          SizedBox(
            height: 26.0,
          ),
          TextField(
            controller: _passwordcontrol,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "User Password",
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.blueAccent,
                )),
          ),
          SizedBox(height: 8.0),
          Text(
            "Don't remember your password?",
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(height: 88.0),
          SizedBox(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: Color(0xFF0069FE),
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                User user = await loginUsingEmailPassword(
                    email: _emailcontrol.text,
                    password: _passwordcontrol.text,
                    context: context);
                print(user);
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Profilescreen()));
                }
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
