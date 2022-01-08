import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fauna/Model/user.dart';
import 'package:fauna/Screens/Details/user_details.dart';
import 'package:fauna/Screens/Services/auth.dart';
import 'package:fauna/Screens/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DraWer extends StatefulWidget {
  const DraWer({Key? key}) : super(key: key);

  @override
  _DraWerState createState() => _DraWerState();
}

class _DraWerState extends State<DraWer> {
  UserAttributes? userAttributes;
  String? uname;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  fetchUser() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        uname = ds.data()!["name"];
      }).catchError((e) {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            child: DrawerHeader(
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/wrapper');
                      },
                      icon: Icon(
                        Icons.perm_identity,
                        size: 60.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: FutureBuilder(
                      future: fetchUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done)
                          return Text("Loading data");

                        return Text("${uname}");
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await authService.signOut();
                      Fluttertoast.showToast(
                          msg: "Log out",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.pushNamed(context, '/home');
                    },
                    icon: Icon(
                      Icons.logout,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.perm_identity),
            title: Text('User'),
            onTap: () async {
              var result = await authService.isUserLoggedIn();
              try {
                if (result != null) {
                  Navigator.pushNamed(context, '/userdetails');
                } else {
                  Fluttertoast.showToast(
                      msg: "Please login first",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              } catch (e) {
                Fluttertoast.showToast(
                    msg: "${e}",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
            onTap: () {
              Navigator.pushNamed(context, '/order');
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Customize flower'),
            onTap: () {
              Navigator.pushNamed(context, '/customflower');
            },
          ),
        ],
      ),
    );
  }
}
