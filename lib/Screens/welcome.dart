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
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300.0,
            child: Center(
              child: Image(
                image: NetworkImage(
                  'https://i.ibb.co/0XpV7qc/flora.png',
                ),
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            child: Text(
              "Spread the love",
              style: kwelcomeLabel,
            ),
          ),
        ],
      ),
    );
  }
}
