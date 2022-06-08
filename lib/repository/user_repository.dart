import 'package:atalay/model/user_info.dart';
import 'package:atalay/services/auth_base.dart';
import 'package:atalay/services/firebase/firebase_auth_service.dart';

import '../locator.dart';
import '../services/firebase/firestore_service.dart';

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirestoreService _firestoreService = locator<FirestoreService>();

  @override
  Future<UserInfoC?> createUserWithEmailandPassword(
      String name, String email, String password, String serialNumber) async {
    UserInfoC? _userInfoC = await _firebaseAuthService
        .createUserWithEmailandPassword(name, email, password, serialNumber);

    bool sonuc = await _firestoreService.setUser(_userInfoC!);

    if (sonuc) {
      return await _firestoreService.readUser(_userInfoC.id!);
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
  Future<UserInfoC?> signInWithEmailandPassword(String email, String sifre) {
    // TODO: implement signInWithEmailandPassword
    throw UnimplementedError();
  }
}
