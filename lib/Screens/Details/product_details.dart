import 'package:badges/badges.dart';
import 'package:fauna/Model/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'body_product_details.dart';

class DetailsScreen extends StatelessWidget {
  final Item item;
  const DetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: item.color,
        actions: <Widget>[
          SizedBox(
            width: 20 / 2,
          ),
        ],
      ),
      body: BodyOfDetailScreen(
        item: item,
      ),
    );
  }
}
