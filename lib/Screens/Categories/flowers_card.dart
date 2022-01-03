import 'dart:math';

import 'package:fauna/Model/item.dart';

// import 'package:fauna/Screens/details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ktitleLabel = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

class FlowerCard extends StatelessWidget {
  final FlowerItem Floweritem;
  final VoidCallback press;
  const FlowerCard({
    Key? key,
    required this.Floweritem,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorCode =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: colorCode,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: 160,
              height: 150,
              decoration: BoxDecoration(
                color: colorCode,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                Floweritem.image.toString(),
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20 / 4),
              child: Text(
                // products is out demo list
                Floweritem.title.toString(),
                style: ktitleLabel,
              ),
            ),
            Text(
              "\$${Floweritem.price}",
              style: ktitleLabel,
            ),
          ],
        ),
      ),
    );
  }
}
