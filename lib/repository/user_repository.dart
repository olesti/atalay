import 'package:atalay/model/user_info.dart';
import 'package:atalay/services/auth_base.dart';
import 'package:atalay/services/firebase/firebase_auth_service.dart';
import 'package:atalay/services/firebase/rt_db_service.dart';

import '../locator.dart';
import '../services/firebase/firestore_service.dart';

class UserRepository implements AuthBase {
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final FirebaseRTDBService _firebaseRTDBService =
      locator<FirebaseRTDBService>();

  @override
  Future<UserInfoC?> createUserWithEmailandPassword(
      String name, String email, String password, String serialNumber) async {
    UserInfoC? _userInfoC = await _firebaseAuthService
        .createUserWithEmailandPassword(name, email, password, serialNumber);

    bool sonuc = await _firebaseRTDBService.setUser(
        _userInfoC!.toJson(), _userInfoC.id!);

    if (sonuc) {
      return await _firebaseRTDBService.readUser(_userInfoC.id!);
    } else {
      return null;
    }
  }

  @override
  Future<UserInfoC?> currentUser() async {
    UserInfoC? _userInfoC = await _firebaseAuthService.currentUser();
    if (_userInfoC != null) {
      return await _firestoreService.readUser(_userInfoC.id!);
    } else {
      return null;
    }
  }

  @override
  Future<UserInfoC?> signInWithEmailandPassword(
      String email, String sifre) async {
    UserInfoC? userInfoC =
        await _firebaseAuthService.signInWithEmailandPassword(email, sifre);
    if (userInfoC != null) {
      return await _firebaseRTDBService.readUser(userInfoC.id!);
    }
    return null;
  }
}
