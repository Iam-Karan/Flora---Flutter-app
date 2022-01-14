import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fauna/Model/item.dart';
import 'package:fauna/Model/order.dart';
import 'package:fauna/Screens/Orders/gift_pack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fauna/Model/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'body_product_details.dart';

bool checkWrap = false;

const kbuttonLabel = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Ubuntu',
);

class Shipping extends StatefulWidget {
  const Shipping({Key? key, required this.productList}) : super(key: key);

  final List<Cart> productList;
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  final firestoreInstance = FirebaseFirestore.instance;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController line = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController zipcode = TextEditingController();
  void _setData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    List productIds = [];
    List numOfProducts = [];

    for(var i =0; i < widget.productList.length; i++){
      productIds.add(widget.productList[i].item.id);
      numOfProducts.add(widget.productList[i].numOfItem);
    }

    Map<String, List> products ={
      "items" : productIds,
      "numofItems" : numOfProducts
    };

    firestoreInstance.collection("orders").add({
      "userid": uid,
      "name": "${firstName.text} ${lastName.text}",
      "address": "${line.text}, ${city.text}, ${state.text}, ${country.text}, ${zipcode.text}",
      "wrap": checkWrap,
      "products" : products

    }).then((_) {
      print("success!");
    });
  }


  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: firstName,
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
                                controller: lastName,
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
                                controller: line,
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
                                controller: city,
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
                                controller: zipcode,
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
                                controller: state,
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
                                controller: country,
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
                            if(firstName.text.isNotEmpty && lastName.text.isNotEmpty && line.text.isNotEmpty && city.text.isNotEmpty && zipcode.text.isNotEmpty && state.text.isNotEmpty && country.text.isNotEmpty){
                              _setData();
                              if (checkWrap == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GiftPack(),
                                  ),
                                );
                              } else {
                                Navigator.pushNamed(context, '/order');
                                // List OrderCart = new List<Cart>.from(demoCarts);
                                // print("OrderCart${OrderCart}");
                                // demoCarts.add(Cart(item: widget.flowerItem, numOfItem: txtQuntity));
                                setState(() {
                                  // demoCarts.clear();
                                });
                              }
                            }else{
                              Fluttertoast.showToast(
                                  msg: "All field must be fill!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }

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
