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
                        builder: (context) => Detailpage(
                            dataTilesList[index].name!,
                            dataTilesList[index].temperature!,
                            dataTilesList[index].blood!,
                            dataTilesList[index].position!,
                            dataTilesList[index].movement!,
                            dataTilesList[index].address!,
                            dataTilesList[index].humidity!,
                            dataTilesList[index].connection!,
                            dataTilesList[index].color,
                            dataTilesList[index].disease!),
                      ),
                    );
                  }),
              leading: Icon(
                Icons.person_outline_sharp,
                color: Colors.black,
              ),
              subtitle: Text(dataTilesList[index].color.toString() +
                  "     " +
                  dataTilesList[index].blood!),
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
            disease: "null",
            humidity: "45.0",
            movement: "false",
            name: "Demo",
            position: "40.993087040640276, 29.043216666803577",
            temperature: 23.5,
            userid: "21",
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
