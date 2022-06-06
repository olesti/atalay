// ignore_for_file: unused_field, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Kayit extends StatefulWidget {
  Kayit({Key? key}) : super(key: key);

  @override
  _KayitState createState() => _KayitState();
}

class _KayitState extends State<Kayit> {
  String _name = '';
  String _serialnummer = '';
  String _email = '';
  String _password = '';
  String _password2 = '';

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText:"Ad Soyadı" ),
      validator: (value){
        if (value!.isEmpty) {
          return "name is required";
          
        }
      },
      onSaved: (value){
        _name = value!;
      }
      
    );
  }

  Widget? _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText:"email" ),
      validator: (value){
        if (value!.isEmpty) {
          return "email is required";
          
        }
      },
      onSaved: (value){
        _email = value!;
      }
      
    );
  }

  Widget? _buildSerail() {
    return TextFormField(
      decoration: InputDecoration(labelText:"serial" ),
      validator: (value){
        if (value!.isEmpty) {
          return "serial is required";
          
        }
      },
      onSaved: (value){
        _serialnummer = value!;
      }
      
    );
  }

  Widget? _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText:"password" ),
      validator: (value){
        if (value!.isEmpty) {
          return "password is required";
          
        }
      },
      onSaved: (value){
        _password = value!;
      }
      
    );
  }

  Widget? _buildPassword2() {
    return TextFormField(
      decoration: InputDecoration(labelText:"Ad Soyadı" ),
      validator: (value){
        if (value!.isEmpty) {
          return "password is required";
        
        }
      },
      onSaved: (value){
        _password2 = value!;
      }
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kullanıcı Kayıt"),
        ),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 // _buildName(),
                  //_buildEmail(),
                  //_buildPassword(),
                  //_buildPassword2(),
                  //_buildSerail(),
                  const SizedBox(
                    height: 100.0,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                      child: const Text(
                        'Submit',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 16),
                      ),
                      onPressed: () {})
                ],
              ),
            )));
  }
}
