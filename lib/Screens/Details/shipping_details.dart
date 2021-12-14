// import 'package:fauna/Screens/Orders/gift_pack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fauna/Model/cart.dart';

bool checkWrap = false;

const kbuttonLabel = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Ubuntu',
);
GlobalKey<FormState> formkey = GlobalKey<FormState>();

class Shipping extends StatefulWidget {
  const Shipping({Key? key}) : super(key: key);

  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        elevation: 0,
        title: Text(
          "Shipping",
          style: GoogleFonts.ubuntu(),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              child: Wrap(
                verticalDirection: VerticalDirection.up,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
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
                                  labelText: "Last Name",
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Last Name must be required"),
                                ]),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Address Line 1",
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(errorText: ""),
                                ]),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "City",
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "City name must be required"),
                                ]),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Zip code",
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Zip Code must be required"),
                                ]),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "State",
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "State name must be required"),
                                ]),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Country",
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText:
                                          "Country name must be required"),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Price:",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              "\$${getTotal().subTotalString}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery fees:",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              "\$${getTotal().deliveryFee()}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Price:",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              "\$${getTotal().total()}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "item wrapping",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Checkbox(
                              activeColor: Colors.red,
                              checkColor: Colors.white,
                              value: checkWrap,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkWrap = value!;
                                });
                                print(checkWrap);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          color: Colors.red,
                          minWidth: double.infinity,
                          height: 50,
                          onPressed: () {
                            // if (checkWrap == true) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => GiftPack(),
                            //     ),
                            //   );
                            // } else {
                            //   Navigator.pushNamed(context, '/order');
                            // }
                          },
                          child: Text(
                            "Order",
                            style: kbuttonLabel,
                          ),
                        ),
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
