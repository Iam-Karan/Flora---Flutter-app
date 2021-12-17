import 'package:fauna/Model/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'gift_card.dart';

class Gifts extends StatefulWidget {
  const Gifts({Key? key}) : super(key: key);

  @override
  _GiftsState createState() => _GiftsState();
}

class _GiftsState extends State<Gifts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OutlineSearchBar(
            margin: EdgeInsets.all(15.0),
            hintStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.black
            ),
            hintText: 'search',
            borderColor: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            textStyle: TextStyle(
                fontSize: 16.0,
                color: Colors.black
            ),
            borderWidth: 2.0,
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
