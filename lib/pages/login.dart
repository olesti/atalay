// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, import_of_legacy_library_into_null_safe
import 'package:atalay/model/user_info.dart';
import 'package:atalay/pages/kayit.dart';
import 'package:atalay/pages/map_yonlendirme.dart';
import 'package:atalay/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/exceptions.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username = "";
  String _password = "";

  //final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  width: 250,
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/taü.png")),
              SizedBox(
                height: 190,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelText: "E-Mail",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Geben Sie Ihr E-Mail ein";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelText: "Passwort",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Geben Sie Ihr Passwort ein";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                      child: const Text("Registrieren"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Kayit()));
                      }),
                  MaterialButton(
                      child: Text("Ihr Passwort vergessen ?"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Kayit()));
                      })
                ],
              ),
              _loginbutton(),
              SizedBox(
                height: 30,
              ),
              Column(
                children: const <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                      height: 100,
                      fit: BoxFit.fitHeight,
                      image: AssetImage("assets/images/tubitak.png")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "       Yiğit Atalay  Wise 2021-2022 \nBachelorarbeit und Tubitak Projekt")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: deprecated_member_use
  Widget _loginbutton() => RaisedButton(
      child: const Text("Einloggen"),
      onPressed: () {
        signIn();
      });

  Future signIn() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      UserModel _userModel = Provider.of<UserModel>(context, listen: false);
      try {
        UserInfoC? userInfoC =
            await _userModel.signInWithEmailandPassword(_username, _password);
        if (userInfoC != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Asil1()));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Exceptions.goster(e.toString()))));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Değerleri Doğru Giriniz')));
    }
  }
}
