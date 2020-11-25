import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento/Model/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserModel userModel = UserModel();

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User user = authResult.user;

    return user;
  }

  Future<User> getCurrentUser() async {
    User currentUser;
    currentUser = await auth.currentUser;
    return currentUser;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
    return await auth.signOut();
  }

  Future<void> deleteUserAccount() async {
    var currentuser = auth.currentUser;
    firestore.collection("users").doc(currentuser.uid).delete();

    return await currentuser.delete();
    // this method used to delete the user current user account
  }

  Future<bool> authenticateUser(User user) async {
    QuerySnapshot result = await firestore
        .collection("users")
        .where("email", isEqualTo: user.email)
        .get();

    final List<DocumentSnapshot> docs = result.docs;

    //if user is registered then length of list > 0 or else less than 0
    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDb(User currentUser) async {
    userModel = UserModel(
      uid: currentUser.uid,
      email: currentUser.email,
      name: currentUser.displayName,
      profilePhoto: currentUser.photoURL,
    );

    firestore
        .collection("users")
        .doc(currentUser.uid)
        .set(userModel.toMap(userModel));
  }
}
