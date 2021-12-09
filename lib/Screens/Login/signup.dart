import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

//Design code
const kbuttonLabel = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
const ksignupHeader = TextStyle(
  fontSize: 40.0,
  color: Colors.red,
  fontWeight: FontWeight.bold,
);
const kloginHeader = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
);
const ksignLogo = "https://cdn-icons-png.flaticon.com/512/4658/4658525.png";
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

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                "Signup",
                style: ksignupHeader,
              ),
            ),
            Positioned(
              top: 200,
              left: 130,
              child: Image.network(
                ksignLogo,
                fit: BoxFit.fill,
                height: 250,
                width: 250,
              ),
            ),
            Positioned(
              child: Wrap(
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
                                  labelText: "First Name",
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "First name must be required"),
                                ]),
                              ),
                              SizedBox(height: 20.0),
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
                          height: 60.0,
                          minWidth: double.infinity,
                          color: Colors.red,
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
                            "Signup",
                            style: kbuttonLabel,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        InkWell(
                            child: new Text(
                              'Already user?',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
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
