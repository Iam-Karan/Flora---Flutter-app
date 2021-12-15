import 'package:fauna/Screens/Orders/body_order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kbuttonLabel = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
        backgroundColor: Colors.white,
        title: Text(
          "Orders",
          style: GoogleFonts.ubuntu(
            // fontSize: 36.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BodyOrder(),
    );
  }
}
