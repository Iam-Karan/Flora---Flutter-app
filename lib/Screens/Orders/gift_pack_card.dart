import 'package:fauna/Model/wraping.dart';
import 'package:flutter/material.dart';

const ktitleLabel = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

class GiftPackCard extends StatelessWidget {
  final Pack pack;
  final VoidCallback press;
  const GiftPackCard({Key? key, required this.pack, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: pack.color,
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
                color: pack.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                pack.image,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20 / 4),
              child: Text(
                // products is out demo list
                pack.title,
                style: ktitleLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
