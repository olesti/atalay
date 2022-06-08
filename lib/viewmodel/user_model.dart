import 'package:atalay/model/user_info.dart';
import 'package:atalay/repository/user_repository.dart';
import 'package:atalay/services/auth_base.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';

enum ViewState { idle, busy }

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.idle;
  UserRepository userRepository = locator<UserRepository>();
  UserInfoC? _userC;

  UserModel() {
    state = ViewState.busy;
    currentUser();
    state = ViewState.idle;
  }

  UserInfoC? get userC => _userC;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<UserInfoC?> createUserWithEmailandPassword(
      String name, String email, String password, String serialNumber) async {
    try {
      state = ViewState.busy;
      UserInfoC? userInfoC = await userRepository
          .createUserWithEmailandPassword(name, email, password, serialNumber);
      return userInfoC;
    } catch (e) {
      print("userModel hata: " + e.toString());
      throw e;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<UserInfoC?> currentUser() async {
    try {
      _userC = await userRepository.currentUser();
      if (_userC != null) {
        notifyListeners();
        return _userC;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Viewmodeldeki current user hata:" + e.toString());
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<UserInfoC?> signInWithEmailandPassword(
      String email, String sifre) async {
    try {
      UserInfoC? userInfoC =
          await userRepository.signInWithEmailandPassword(email, sifre);
      if (userInfoC != null) {
        _userC = userInfoC;
        return _userC;
      }
      return null;
    } catch (e) {
      print("userModel hata: " + e.toString());
      throw e;
    }
  }
}
