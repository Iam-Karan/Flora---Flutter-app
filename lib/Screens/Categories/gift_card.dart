import 'package:fauna/Model/item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kcategoryLabel = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

class ItemCard extends StatelessWidget {
  final Item item;
  final Function press;
  const ItemCard({
    Key? key,
    required this.item,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("item ${item.title} selected");
      },
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Text(
              item.title,
              style: GoogleFonts.ubuntu(fontSize: 25, color: Colors.white),
            )),
          ],
        ),
      ),
    );
  }
}
