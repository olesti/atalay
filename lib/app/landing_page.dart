import 'package:atalay/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/user_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: true);
    if (_userModel.state == ViewState.idle) {
      if (_userModel.userC == null) {
        return Login();
      } else {
        return const Center(
          child: Text("HomePage"),
        );
      }
    } else {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("HomePage"),
        ),
      );
    }
  }
}
