import 'dart:math';

import 'package:badges/badges.dart';
import 'package:fauna/Model/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'body_product_details.dart';

class DetailsScreen extends StatelessWidget {
  final FlowerItem Floweritem;
  const DetailsScreen({Key? key, required this.Floweritem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorCode =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Scaffold(
      backgroundColor: colorCode,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorCode,
        actions: <Widget>[
          SizedBox(
            width: 20 / 2,
          ),
        ],
      ),
      body: BodyOfDetailScreen(
        flowerItem: Floweritem,
        colorcode: colorCode,
      ),
    );
  }
}
