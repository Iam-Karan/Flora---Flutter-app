import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

GlobalKey<FormState> formkey = GlobalKey<FormState>();
const kbuttonLabel = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
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

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
              child: SizedBox(
                width: size.width,
                height: 250.0,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/64/64572.png"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 50.0, 20, 0),
              child: Column(
                children: [
                  Container(
                    child: Form(
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
                                  errorText: "Name must be required"),
                            ]),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                            ),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Email must be required"),
                              EmailValidator(errorText: "Not a valid email"),
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
                  ),
                  SizedBox(height: 100.0),
                  MaterialButton(
                    height: 60.0,
                    minWidth: double.infinity,
                    color: Colors.deepOrange,
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
                      "Update",
                      style: kbuttonLabel,
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
