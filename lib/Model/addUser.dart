import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NewUser {
  final String uid;
  String? name;
  bool? allergie;
  NewUser({required this.uid, this.name, this.allergie});
  //add user
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser(String email, String name, bool allergie) async {
    return users
        .doc(uid)
        .set({
          'email': email,
          'uid': uid,
          'name': name,
          'allegie': allergie,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //update user
  Future updateUser(
      String name, String email, String password, bool allergie) async {
    return await users
        .doc(uid)
        .update({
          'email': email,
          'uid': uid,
          'name': name,
          'allegie': allergie,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
