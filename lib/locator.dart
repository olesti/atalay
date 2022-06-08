import 'package:get_it/get_it.dart';

import 'repository/user_repository.dart';
import 'services/firebase/firebase_auth_service.dart';
import 'services/firebase/firestore_service.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FirestoreService());
}
