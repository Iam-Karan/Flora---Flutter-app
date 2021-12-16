// import 'dart:async';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kbuttonLabel = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kwelcomeLabel = TextStyle(
  color: Colors.red,
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 30), () => Navigator.pushNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 150, left: 160, right: 150),
                child: Text(
                  "Welcome",
                  style: kwelcomeLabel,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 250, left: 10, right: 10),
                width: double.infinity,
                height: 300.0,
                child: Center(
                  child: Image.asset(
                    'assets/images/welcome1.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Positioned(
              //   top: 0,
              //   left: 0,
              //   child: Image.network(
              //     "https://cdn-icons-png.flaticon.com/512/2890/2890930.png",
              //     fit: BoxFit.fill,
              //     height: 250,
              //     width: 250,
              //   ),
              // ),
              Positioned(
                bottom: 150.0,
                left: 20.0,
                right: 20.0,
                child: Column(
                  children: [
                    MaterialButton(
                      color: Colors.deepOrange,
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Login",
                        style: kbuttonLabel,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    MaterialButton(
                      color: Colors.deepOrange,
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        "Signup",
                        style: kbuttonLabel,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
