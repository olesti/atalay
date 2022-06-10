import 'package:atalay/model/user_info.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRTDBService {
  DatabaseReference rtdbRef = FirebaseDatabase.instance.reference();

  Future<bool> setUser(Map<String, dynamic> userMap, String userID) async {
    try {
      await rtdbRef.child("users/$userID").set(userMap);
    } catch (e) {
      print("rtdb setUser hata: " + e.toString());
      return false;
    }
    return true;
  }

  Future<UserInfoC?> readUser(String userID) async {
    DataSnapshot snapshot = await rtdbRef.child("users/$userID").get();
    if (snapshot.exists) {
      return UserInfoC.fromJson(Map<String, dynamic>.from(snapshot.value));
    }
    return null;
  }

  Future<bool> addUser(Map<String, dynamic> dataTilesMap) async {
    try {
      await rtdbRef.child("Users").push().set(dataTilesMap);
    } catch (e) {
      print("rtdb addUser hata: " + e.toString());
      return false;
    }
    return true;
  }
}
