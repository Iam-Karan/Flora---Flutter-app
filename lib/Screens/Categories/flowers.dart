import 'package:fauna/Model/item.dart';
import 'package:fauna/Screens/Details/product_details.dart';

// import 'package:fauna/Screens/details/product_details.dart';
import 'package:flutter/material.dart';

import 'flowers_card.dart';

class Flowers extends StatefulWidget {
  const Flowers({Key? key}) : super(key: key);

  @override
  _FlowersState createState() => _FlowersState();
}

class _FlowersState extends State<Flowers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index) => FlowerCard(
          item: items[index],
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  item: items[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
