import 'package:atalay/model/user_info.dart';
import 'package:atalay/services/auth_base.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserInfoC?> createUserWithEmailandPassword(
      String name, String email, String password, String serialNumber) async {
    UserCredential sonuc = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserInfoC(
        email: email,
        id: sonuc.user!.uid,
        name: name,
        password: password,
        serialNumber: serialNumber);
  }

  @override
  Future<UserInfoC?> currentUser() {
    try {
      User? user = _firebaseAuth.currentUser;
      return Future.value(_userFromFirebase(user));
    } catch (e) {
      print("Firebase HATA CURRENT USER: " + e.toString());
      return Future.value(null);
    }
  }

  UserInfoC? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    } else {
      return UserInfoC(id: user.uid, email: user.email, name: user.displayName);
    }
  }

  @override
  Future<UserInfoC?> signInWithEmailandPassword(
      String email, String sifre) async {
    UserCredential sonuc = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: sifre);
    return _userFromFirebase(sonuc.user);
  }
}
