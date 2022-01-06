import 'package:fauna/Model/addUser.dart';
import 'package:fauna/Model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController FirstnameController = TextEditingController();
  final TextEditingController allergieController = TextEditingController();
  List<bool> allergie = [true, false]; // Option 2
  bool? _selectedAllergie;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          elevation: 0,
          title: Text(
            "User Profile",
            style: GoogleFonts.ubuntu(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
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
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: FirstnameController,
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
                                controller: emailController,
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
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Password",
                                ),
                                validator: validatePassword,
                              ),
                              SizedBox(height: 20.0),
                              DropdownButton(
                                hint: Text(
                                    'Do you have any allergie'), // Not necessary for Option 1
                                value: _selectedAllergie,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _selectedAllergie = newValue!;
                                  });
                                },
                                items: allergie.map((location) {
                                  return DropdownMenuItem<bool>(
                                    child: Text('${allergie}'),
                                    value: location,
                                  );
                                }).toList(),
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
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            print("validated");
                            await NewUser(uid: uid).updateUser(
                              FirstnameController.text,
                              emailController.text,
                              passwordController.text,
                              _selectedAllergie!,
                            );
                            Navigator.pop(context);
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
        ));
  }
}
