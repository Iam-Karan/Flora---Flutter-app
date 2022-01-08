import 'package:fauna/Model/item.dart';
import 'package:fauna/Screens/Orders/body_cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fauna/Model/cart.dart';

const kbuttonLabel = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: SizedBox(
          height: 40,
          width: 40,
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        // toolbarHeight: 80.0,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: GoogleFonts.ubuntu(
                // fontSize: 36.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${demoCarts.length} items",
              style: GoogleFonts.ubuntu(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: BodyCart(),
      bottomNavigationBar: Container(
        height: 100,
        child: Stack(
          children: [
            Positioned(
              top: 60.0,
              left: 20,
              child: Text(
                "Total Price:",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Positioned(
              top: 60.0,
              right: 20,
              child: Text(
                "${getTotal().subTotalString}",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Positioned(
              child: MaterialButton(
                color: Colors.red,
                minWidth: double.infinity,
                height: 50,
                onPressed: () {
                  Navigator.pushNamed(context, '/shipping');
                  setState(() {
                    //  demoCarts.clear();
                  });
                },
                child: Text(
                  "Checkout",
                  style: kbuttonLabel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
