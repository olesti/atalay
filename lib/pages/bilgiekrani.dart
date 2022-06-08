// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:atalay/app/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Bilgi extends StatelessWidget {
  Bilgi({Key? key}) : super(key: key);
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You have an error ${snapshot.error.toString()}');
                return Text('something went wrong!');
              } else if (snapshot.hasData) {
                return LandingPage();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
