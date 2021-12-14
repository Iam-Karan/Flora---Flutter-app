import 'package:fauna/Model/cart.dart';
import 'package:flutter/material.dart';
import 'cart_item_card.dart';

const ktxtColor = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.red,
  fontFamily: 'Ubuntu',
);

class BodyCart extends StatefulWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  _BodyCartState createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: Row(
                  children: [
                    Spacer(),
                    Icon(Icons.delete),
                  ],
                ),
              ),
              child: CartItemCard(
                cart: demoCarts[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
