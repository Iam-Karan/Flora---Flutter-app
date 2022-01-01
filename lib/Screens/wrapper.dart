import 'package:fauna/Model/user.dart';
import 'package:fauna/Screens/Home/home.dart';
import 'package:fauna/Screens/Login/login.dart';
import 'package:fauna/Screens/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<UserAttributes?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<UserAttributes?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final UserAttributes? userAttributes = snapshot.data;
            return userAttributes == null ? Login() : Home();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
