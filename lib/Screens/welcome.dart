// import 'dart:async';
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
  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 60),
  //       () => Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (BuildContext context) => Login())));
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: Image.network(
                  'https://images.pexels.com/photos/1172849/pexels-photo-1172849.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Text(
                  "Welcome",
                  style: kwelcomeLabel,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/2890/2890930.png",
                  fit: BoxFit.fill,
                  height: 250,
                  width: 250,
                ),
              ),
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
