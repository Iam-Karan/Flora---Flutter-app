import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserAttributes {
  final String uid;
  final String? email;

  UserAttributes({required this.email, required this.uid});
}
