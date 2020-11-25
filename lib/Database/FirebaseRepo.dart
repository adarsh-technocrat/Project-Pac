import 'package:evento/Database/FirebaseMethods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseRepo {
  FirebaseMethod _firebaseMethod = FirebaseMethod();

  Future<User> signInWithGoogle() => _firebaseMethod.signInWithGoogle();
  Future<void> signOutGoogle() => _firebaseMethod.signOutGoogle();
  Future<User> getCurrentUser() => _firebaseMethod.getCurrentUser();
  Future<bool> authenticateUser(User user) =>
      _firebaseMethod.authenticateUser(user);
  Future<void> addDataToDb(User currentUser) =>
      _firebaseMethod.addDataToDb(currentUser);
  Future<void> deleteUserAccount() => _firebaseMethod.deleteUserAccount();
}
