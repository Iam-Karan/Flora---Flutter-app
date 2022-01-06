import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fauna/Model/addUser.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:fauna/Model/user.dart";
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

AccessToken? _accessToken;

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

  //LoginWithFacebook

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult =
        await FacebookAuth.instance.login(permissions: ['email']);
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    final userData = await FacebookAuth.instance.getUserData();
    String userEmail = userData['email'];
    print(userEmail.toString());
    // UserAttributes userAttributes = UserAttributes(email: userEmail, );

    // await NewUser(uid: _accessToken!.userId).addUser('${userEmail}');
    return await _auth.signInWithCredential(facebookAuthCredential);
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
      {required String email,
      required String password,
      required String name,
      required bool allergie}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final userEmail = credential.user?.email;
      print('${userEmail}');
      //Stores the data in the users collection
      await NewUser(uid: credential.user!.uid, name: name)
          .addUser('${userEmail}', name, allergie);
      return _userFromFirebase(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
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
