import 'package:flutter/material.dart';
import 'package:fauna/Model/wraping.dart';

import 'gift_pack_card.dart';

class GiftPack extends StatefulWidget {
  const GiftPack({Key? key}) : super(key: key);

  @override
  _GiftPackState createState() => _GiftPackState();
}

class _GiftPackState extends State<GiftPack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.red,
        title: Text("Gift wrapping"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
        child: GridView.builder(
          itemCount: wraps.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
          itemBuilder: (context, index) => GiftPackCard(
            pack: wraps[index],
            press: () {
              Navigator.pushNamed(context, '/order');
            },
          ),
        ),
      ),
    );
  }
}
