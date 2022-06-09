import 'package:atalay/model/user_info.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRTDBService {
  FirebaseDatabase rtdb = FirebaseDatabase.instance;

  Future<bool> setUser(Map<String, dynamic> userMap, String userID) async {
    try {
      await rtdb.reference().child("users/$userID").set(userMap);
    } catch (e) {
      print("rtdb setUser hata: " + e.toString());
      return false;
    }
    return true;
  }

  Future<UserInfoC?> readUser(String userID) async {
    DataSnapshot snapshot = await rtdb.reference().child("users/$userID").get();
    if (snapshot.exists) {
      return UserInfoC.fromJson(Map<String, dynamic>.from(snapshot.value));
    }
    return null;
  }
}
