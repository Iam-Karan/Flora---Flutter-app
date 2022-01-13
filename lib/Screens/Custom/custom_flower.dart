import 'package:fauna/Model/favorite_model.dart';
import 'package:fauna/Model/item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_flower_card.dart';
// import 'favorite_card.dart';

class CustomFlower extends StatefulWidget {
  const CustomFlower({Key? key}) : super(key: key);

  @override
  _CustomFlowerState createState() => _CustomFlowerState();
}

class _CustomFlowerState extends State<CustomFlower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        elevation: 0,
        title: Text(
          "Customize Bouquet",
          style: GoogleFonts.ubuntu(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            itemCount: flowerItems.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
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
                child: CustomFlowerCard(
                  item: flowerItems[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
