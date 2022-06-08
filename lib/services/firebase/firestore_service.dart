import 'package:atalay/model/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference usersRef;

  FirestoreService() {
    usersRef = _firestore.collection("Users").withConverter<UserInfoC>(
        fromFirestore: (snapshot, _) => UserInfoC.fromJson(snapshot.data()!),
        toFirestore: (userInfoC, _) => userInfoC.toJson());
  }

  Future<UserInfoC> readUser(String userId) async {
    return (await usersRef
        .doc(userId)
        .get()
        .then((snapshot) => snapshot.data()!)) as UserInfoC;
  }

  Future<bool> setUser(UserInfoC userInfoC) async {
    try {
      await usersRef.doc(userInfoC.id).set(userInfoC);
    } catch (e) {
      print("db setData hata: " + e.toString());
      return false;
    }
    return true;
  }
}
