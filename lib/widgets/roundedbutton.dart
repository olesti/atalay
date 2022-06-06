// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:atalay/pallete.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const RoundedButton({
    Key? key,
    required this.buttonName,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: FlatButton(
        onPressed: onClicked,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
