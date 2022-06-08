// ignore_for_file: unused_field, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:atalay/model/user_info.dart';
import 'package:atalay/viewmodel/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/exceptions.dart';

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
        decoration: InputDecoration(labelText: "Ad Soyadı"),
        validator: (value) {
          if (value!.isEmpty) {
            return "name is required";
          }
        },
        onSaved: (value) {
          _name = value!;
        });
  }

  Widget _buildEmail() {
    return TextFormField(
        decoration: InputDecoration(labelText: "email"),
        validator: (value) {
          if (value!.isEmpty) {
            return "email is required";
          }
        },
        onSaved: (value) {
          _email = value!;
        });
  }

  Widget _buildSerail() {
    return TextFormField(
        decoration: InputDecoration(labelText: "serial"),
        validator: (value) {
          if (value!.isEmpty) {
            return "serial is required";
          }
        },
        onSaved: (value) {
          _serialnummer = value!;
        });
  }

  Widget _buildPassword() {
    return TextFormField(
        decoration: InputDecoration(labelText: "password"),
        validator: (value) {
          if (value!.isEmpty) {
            return "password is required";
          }
        },
        onSaved: (value) {
          _password = value!;
        });
  }

  Widget _buildPassword2() {
    return TextFormField(
        decoration: InputDecoration(labelText: "Ad Soyadı"),
        validator: (value) {
          if (value!.isEmpty) {
            return "password is required";
          }
        },
        onSaved: (value) {
          _password2 = value!;
        });
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
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildName(),
                  _buildEmail(),
                  _buildPassword(),
                  _buildPassword2(),
                  _buildSerail(),
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
                      onPressed: () {
                        _generateNewUser();
                      })
                ],
              ),
            )));
  }

  Future _generateNewUser() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState?.save();
      if (_password == _password2) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Üye Kayıt Ediliyor...')));

        UserModel _userModel = Provider.of<UserModel>(context, listen: false);
        try {
          UserInfoC? userInfoC =
              await _userModel.createUserWithEmailandPassword(
                  _name, _email, _password, _serialnummer);
          if (userInfoC != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Kaydınız Başarıyla Gerçekleştirildi 👍')));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Üye Kayıt Edilirken HATA 😕')));
          }
        } on FirebaseAuthException {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Bu hesap kullanımda')));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(Exceptions.goster(e.toString()))));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Şifreler Uyuşmuyor')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Değerleri Doğru Giriniz')));
    }
  }
}
