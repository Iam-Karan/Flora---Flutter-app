import 'package:fauna/Model/cart.dart';
import 'package:fauna/Model/order.dart';
import 'package:fauna/Screens/Orders/order_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BodyOrder extends StatefulWidget {
  const BodyOrder({Key? key}) : super(key: key);

  @override
  _BodyOrderState createState() => _BodyOrderState();
}

class _BodyOrderState extends State<BodyOrder> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          itemCount: OrderCart.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  OrderCart.removeAt(index);
                });
              },
              key: Key(OrderCart[index].item.id.toString()),
              background: Container(
                color: Colors.red,
                child: Row(
                  children: [
                    Spacer(),
                    Icon(Icons.delete),
                  ],
                ),
              ),
              child: OrderCard(
                cart: OrderCart[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
