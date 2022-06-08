import '../model/user_info.dart';

abstract class AuthBase {
  Future<UserInfoC?> currentUser();
  Future<UserInfoC?> signInWithEmailandPassword(String email, String sifre);
  Future<UserInfoC?> createUserWithEmailandPassword(
      String name, String email, String password, String serialNumber);
}
