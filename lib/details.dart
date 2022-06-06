import 'package:flutter/material.dart';
class Detailpage extends StatelessWidget {
  late final int index;
  Detailpage(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The detail Page"),
      ),
      body: Center(
        child: Text("the details page #$index", style: const TextStyle(fontSize: 32.0)),
      ),
    );
  }
}