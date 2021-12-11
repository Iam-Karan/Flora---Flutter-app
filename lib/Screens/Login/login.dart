import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Design/login_design.dart';
import 'package:form_field_validator/form_field_validator.dart';

//declaration
GlobalKey<FormState> formkey = GlobalKey<FormState>();

void validate() {
  if (formkey.currentState!.validate()) {
    print("validated");
  } else {
    print("Not validated");
  }
}

String? validatePassword(value) {
  if (value.isEmpty) {
    return "Password is required";
  } else if (value.length < 6) {
    return "Password shoulb be atleast 6 charcaters";
  } else if (value.length > 15) {
    return "Password shoulb not be more than 15 charcaters";
  } else {
    return null;
  }
}

//main code
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(180, 100, 0, 10),
              child: Text(
                "Login",
                style: kloginHeader,
              ),
            ),
            Positioned(
              top: 200,
              left: 130,
              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.fill,
                height: 250,
                width: 250,
              ),
            ),
            Positioned(
              child: Wrap(
                spacing: 20.0,
                verticalDirection: VerticalDirection.up,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(50, 500, 50, 0),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: formkey,
                          autovalidate: true,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Email",
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Email must be required"),
                                  EmailValidator(
                                      errorText: "Not a valid email"),
                                ]),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Password",
                                ),
                                validator: validatePassword,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        MaterialButton(
                          color: Colors.deepOrange,
                          height: 60.0,
                          minWidth: double.infinity,
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              print("validated");
                              Navigator.pushNamed(context, '/home');
                            } else {
                              print("Not validated");
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Text(
                            "Login",
                            style: kbuttonLabel,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        InkWell(
                            child: new Text(
                              'New user?',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onTap: () {
                              print("Signup");
                              Navigator.pushNamed(context, '/signup');
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
