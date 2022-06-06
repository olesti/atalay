import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:atalay/bilgidetay.dart';

class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Container(
          height: 100,
          color: Colors.white,
          child: Row(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ListTile(
                          title: Text("Deprem öncesşnde yapılması gerekenler"),
                          subtitle: Text("Okumak için "),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detailpage2(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                child: Text("PLAY"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Detailpage2(),
                                    ),
                                  );
                                }),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                flex: 8,
              ),
            ],
          ),
        ),
        elevation: 8,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
