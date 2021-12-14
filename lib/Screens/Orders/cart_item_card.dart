import 'package:fauna/Model/cart.dart';
import 'package:flutter/material.dart';

const ktxtColor = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.red,
  fontFamily: 'Ubuntu',
);

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key, required this.cart}) : super(key: key);
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 120.0,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.item.image),
            ),
          ),
        ),
        SizedBox(
          width: size.width / 8,
        ),
        Column(
          children: [
            Text(
              cart.item.title,
              style: ktxtColor,
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.item.price}",
                style: ktxtColor,
                children: [
                  TextSpan(
                    text: "x${cart.numOfItem}",
                    style: ktxtColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
