// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:atalay/pages/bilgiekrani.dart';
import 'package:atalay/pages/kayit.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _username;
  var _password;

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
              TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelText: "E-posta Adresi",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "E-posta Adresinizi giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _username = value;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                    ),
                    labelText: "Parola",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Parolanızı giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(child: const Text("Kayıt"), onPressed: () {}),
                  MaterialButton(
                      child: Text("Şifremi unuttum"),
                      onPressed: () {
                        setState(() {
                          Kayit();
                        });
                      })
                ],
              ),
              //_loginbutton()
            ],
          ),
        ),
      ),
    );
  }
  // ignore: deprecated_member_use
  /*Widget _loginbutton () => RaisedButton(
    child: const Text("Giriş Yap"), 
    onPressed: () {signIn(_username, _password);
      }
    
    ); 
    void signIn(String email, String password) async{
      if (_formkey.currentState!.validate()){

      
        await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
          //Fluttertoast.showToast(msg: "giriş başarılı"),
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Bilgi())),

        }).catchError((e)
        {
         // Fluttertoast.showToast(msg: e!.message);
        }
        
        );
      }
    }*/
}
