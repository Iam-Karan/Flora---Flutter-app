import 'package:fauna/Model/item.dart';
import 'package:flutter/cupertino.dart';

import 'gift_card.dart';

class Gifts extends StatefulWidget {
  const Gifts({Key? key}) : super(key: key);

  @override
  _GiftsState createState() => _GiftsState();
}

class _GiftsState extends State<Gifts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index) => ItemCard(
          item: items[index],
          press: () {},
        ),
      ),
    );
  }
}
