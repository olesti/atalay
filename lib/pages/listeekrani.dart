// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:atalay/model/data_tiles.dart';
import 'package:atalay/viewmodel/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../details.dart';
import '../model/data_tilessort.dart';

class Liste extends StatefulWidget {
  final GlobalKey? globalKey;
  const Liste({Key? key, this.globalKey}) : super(key: key);

  @override
  State<Liste> createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  /*
  final List<DataTiles> dataTilesList = [
   
    DataTiles(
        name: 'Bekir Karagöz',
        color: Colors.red.shade300,
        subtitle: "Kronik Hasta, 71y, AB-",
        hareket: true,
        gaz: false,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Semih Samsun',
        color: Colors.red.shade400,
        subtitle: "Sağlıklı, 50y, 0-",
        hareket: false,
        gaz: true,
        konum: LatLng(41.007710, 29.06528)),
    DataTiles(
        name: 'Kağan Porsuk',
        color: Colors.red.shade700,
        subtitle: "Hasta, 41, A-",
        hareket: false,
        gaz: false,
        konum: LatLng(41.007710, 29.06528)),
  ];*/

  List<DataTiles> dataTilesList = [];

  List<Color> dataTilecolor = [];
  @override
  void initState() {
    super.initState();
    getListener();
  }

  var colorss;
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

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            addUser();
          },
        ),
      ),
      body: ListView.builder(
        physics: ScrollPhysics(parent: null),
        shrinkWrap: true,
        itemBuilder: (listViewContext, int index) {
          dataTilecolor.length = dataTilesList.length;
          dataTilesList.sort((a, b) => b.color.compareTo(a.color));

          if (dataTilesList[index].color <= 45 &&
              dataTilesList[index].color >= 20) {
            dataTilecolor[index] = Color.fromARGB(255, 189, 143, 5);
          } else if (dataTilesList[index].color < 20) {
            dataTilecolor[index] = Colors.green;
          } else {
            dataTilecolor[index] = Colors.red;
          }

          return Card(
            color: dataTilecolor[index],
            child: ListTile(
              title: Text(dataTilesList[index].name!),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailpage(index),
                      ),
                    );
                  }),
              leading: Icon(Icons.supervised_user_circle),
              subtitle: Text(dataTilesList[index].blood!),
              //selected: index = dataTilesList[index].,
              onTap: () {
                UserModel userModel =
                    Provider.of<UserModel>(context, listen: false);
                userModel.focusDataTiles = dataTilesList[index];

                final CupertinoTabBar cupertinoTabBar =
                    widget.globalKey!.currentWidget as CupertinoTabBar;
                cupertinoTabBar.onTap!(1);

                /*//eğer sayfa Asil navbar ile ise aşağısı
                final BottomNavigationBar cupertinoTabBar =
                    widget.globalKey!.currentWidget as BottomNavigationBar;
                cupertinoTabBar.onTap!(1);*/
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Mapsa(
                      userKey: dataTilesList[index].key,
                    ),
                  ),
                );*/
              },
            ),
          );
        },
        itemCount: dataTilesList.length,
      ),
    );
  }

  Future addUser() async {
    UserModel userModel = Provider.of<UserModel>(context, listen: false);
    bool sonuc = await userModel.addUser(DataTiles(
            address: "05442451425",
            blood: "B RH-",
            connection: "B",
            disease: "No",
            humidity: "45.0",
            movement: "false",
            name: "Demo",
            position: "40.993087040640276, 29.043216666803577",
            temperature: 23.5,
            userid: "3",
            color: 0)
        .toJson());
    if (sonuc) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Yeni kullanıcı rtdb e eklendi')));
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Yeni kullanıcı eklenirken bir sorun çıktı')));
    }
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

int hesaplama(String b, String c, double s4) {
  var s5;
  s5 = s4;
  int point = 0;
  if (c == "false") {
    point += 50;
  } else if (b == "Kronik Hasta") {
    point += 30;
  } else if (b == "Hasta") {
    point += 15;
  } else if (b == "Sağlıklı") {
    point += 0;
  } else if (s5 <= 17) {
    point += 10;
  } else if (s5 >= 30) {
    point += 5;
  }
  return point;
}
