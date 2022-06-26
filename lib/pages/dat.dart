// ignore_for_file: unused_local_variable, prefer_const_constructors, unnecessary_new, sized_box_for_whitespace, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'pages2details/deta.dart';
import 'pages2details/dsas.dart';

class name extends StatefulWidget {
  const name({Key? key}) : super(key: key);

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            Container(
              height: 180,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                color: Color(0xFF363f93),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 60,
                      left: 0,
                      child: Container(
                        height: 70,
                        width: 300,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50))),
                      )),
                  Positioned(
                      top: 70,
                      left: 20,
                      child: Text(
                          "Informationen für vor und \nnach dem ERDBEBEN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 99, 165))))
                ],
              ),
            ),
            /*SizedBox(
              height: height + 0.05,
            ),*/
            new InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Asall(),
                  ));
                },
                child: Container(
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 35,
                          left: 20,
                          child: Material(
                              child: Container(
                            height: 180.0,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 252, 252, 252),
                                borderRadius: BorderRadius.circular(0.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(186, 0, 255, 191)
                                        .withOpacity(0.3),
                                    offset: new Offset(-10, 10),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                          ))),
                      Positioned(
                          top: 55,
                          left: 30,
                          child: Card(
                              color: Colors.amber,
                              elevation: 10.0,
                              //shadowColor: Colors.grey.withOpacity(0.5),
                              /*shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),*/
                              child: Container(
                                  height: 135,
                                  width: 112.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      //fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/dunya3.png"),
                                    ),
                                  )))),
                      Positioned(
                          top: 45,
                          left: 160,
                          child: Container(
                            height: 150,
                            width: 180,
                            child: Column(children: [
                              Text(
                                "Vorbereitungen vor dem Erdbeben",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF363f93),
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              Text(
                                "Notfalltasche usw.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]),
                          ))
                    ],
                  ),
                )),
            new InkWell(
                child: Container(
              height: 230,
              child: Stack(
                children: [
                  Positioned(
                      top: 35,
                      left: 20,
                      child: Material(
                          child: Container(
                        height: 180.0,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 252, 252, 252),
                            borderRadius: BorderRadius.circular(0.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(186, 0, 255, 191)
                                    .withOpacity(0.3),
                                offset: new Offset(-10, 10),
                                blurRadius: 15.0,
                                spreadRadius: 1.0,
                              )
                            ]),
                      ))),
                  Positioned(
                      top: 55,
                      left: 30,
                      child: Card(
                          color: Colors.amber,
                          elevation: 10.0,
                          //shadowColor: Colors.grey.withOpacity(0.5),
                          /*shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),*/
                          child: Container(
                              height: 135,
                              width: 112.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  //fit: BoxFit.fill,
                                  image: AssetImage("assets/images/dunya1.png"),
                                ),
                              )))),
                  Positioned(
                      top: 45,
                      left: 160,
                      child: Container(
                        height: 150,
                        width: 180,
                        child: Column(children: [
                          Text(
                            "Was tun in der Zeit eines Erdbebens",
                            style: TextStyle(
                                fontSize: 19,
                                color: Color(0xFF363f93),
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            "Orte, an denen man sich bei einem Erdbeben verstecken kann, was danach zu tun ist",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                          ),
                        ]),
                      ))
                ],
              ),
            )),
          ],
        ));
    /* //burası scroll denemesi
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                color: Color(0xFF363f93),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 80,
                      left: 0,
                      child: Container(
                        height: 70,
                        width: 300,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50))),
                      )),
                  Positioned(
                      top: 90,
                      left: 20,
                      child: Text(
                          "Informationen für vor und \nnach dem ERDBEBEN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 99, 165))))
                ],
              ),
            ),
            /*SizedBox(
              height: height + 0.05,
            ),*/
            ListView.builder(
              physics: ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(children: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => Asall(),
                        ));
                      },
                      child: Container(
                        height: 230,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 35,
                                left: 20,
                                child: Material(
                                    child: Container(
                                  height: 180.0,
                                  width: width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 252, 252, 252),
                                      borderRadius: BorderRadius.circular(0.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(186, 0, 255, 191)
                                                  .withOpacity(0.3),
                                          offset: new Offset(-10, 10),
                                          blurRadius: 15.0,
                                          spreadRadius: 1.0,
                                        )
                                      ]),
                                ))),
                            Positioned(
                                top: 55,
                                left: 30,
                                child: Card(
                                    color: Colors.amber,
                                    elevation: 10.0,
                                    //shadowColor: Colors.grey.withOpacity(0.5),
                                    /*shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),*/
                                    child: Container(
                                        height: 135,
                                        width: 112.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            //fit: BoxFit.fill,
                                            image: AssetImage(
                                                "assets/images/dunya3.png"),
                                          ),
                                        )))),
                            Positioned(
                                top: 45,
                                left: 160,
                                child: Container(
                                  height: 150,
                                  width: 180,
                                  child: Column(children: [
                                    Text(
                                      "Vorbereitungen vor dem Erdbeben",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF363f93),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Notfalltasche usw.",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ]),
                                ))
                          ],
                        ),
                      )),
                  InkWell(
                      child: Container(
                    height: 230,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 35,
                            left: 20,
                            child: Material(
                                child: Container(
                              height: 180.0,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 252, 252, 252),
                                  borderRadius: BorderRadius.circular(0.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(186, 0, 255, 191)
                                          .withOpacity(0.3),
                                      offset: new Offset(-10, 10),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                    )
                                  ]),
                            ))),
                        Positioned(
                            top: 55,
                            left: 30,
                            child: Card(
                                color: Colors.amber,
                                elevation: 10.0,
                                //shadowColor: Colors.grey.withOpacity(0.5),
                                /*shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),*/
                                child: Container(
                                    height: 135,
                                    width: 112.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        //fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/images/dunya1.png"),
                                      ),
                                    )))),
                        Positioned(
                            top: 45,
                            left: 160,
                            child: Container(
                              height: 150,
                              width: 180,
                              child: Column(children: [
                                Text(
                                  "Was tun in der Zeit eines Erdbebens",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Color(0xFF363f93),
                                      fontWeight: FontWeight.bold),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Text(
                                  "Orte, an denen man sich bei einem Erdbeben verstecken kann, was danach zu tun ist",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                ),
                              ]),
                            ))
                      ],
                    ),
                  )),
                  InkWell(
                      child: Container(
                    height: 230,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 35,
                            left: 20,
                            child: Material(
                                child: Container(
                              height: 180.0,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 252, 252, 252),
                                  borderRadius: BorderRadius.circular(0.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(186, 0, 255, 191)
                                          .withOpacity(0.3),
                                      offset: new Offset(-10, 10),
                                      blurRadius: 15.0,
                                      spreadRadius: 1.0,
                                    )
                                  ]),
                            ))),
                        Positioned(
                            top: 55,
                            left: 30,
                            child: Card(
                                color: Colors.amber,
                                elevation: 10.0,
                                //shadowColor: Colors.grey.withOpacity(0.5),
                                /*shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),*/
                                child: Container(
                                    height: 135,
                                    width: 112.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        //fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/images/dunya1.png"),
                                      ),
                                    )))),
                        Positioned(
                            top: 45,
                            left: 160,
                            child: Container(
                              height: 150,
                              width: 180,
                              child: Column(children: [
                                Text(
                                  "Was tun in der Zeit eines Erdbebens",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Color(0xFF363f93),
                                      fontWeight: FontWeight.bold),
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                Text(
                                  "Orte, an denen man sich bei einem Erdbeben verstecken kann, was danach zu tun ist",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                ),
                              ]),
                            ))
                      ],
                    ),
                  ))
                ]);
              },
              itemCount: 1,
            ),
          ],
        ));*/
  }
}
