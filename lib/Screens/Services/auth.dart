import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fauna/Model/addUser.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:fauna/Model/user.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserAttributes? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return UserAttributes(uid: user.uid, email: user.email);
  }

  Stream<UserAttributes?>? get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //Login
  Future<UserAttributes?> signInWithEmailAndPasswod(
      {required String email, required String password}) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  //Register
  Future<UserAttributes?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final userEmail = credential.user?.email;
    print('${userEmail}');
    //Stores the data in the users collection
    await NewUser(uid: credential.user!.uid).addUser('${userEmail}');
    return _userFromFirebase(credential.user);
  }

  //Logout
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //Annonymus
  Future signInAnon() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  bool isUserLoggedIn() {
    return NewUser != null;
  }
}
