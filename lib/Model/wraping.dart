import 'package:flutter/material.dart';

class Pack {
  final String image, title;
  final int price, id;
  final Color color;

  Pack({
    required this.price,
    required this.id,
    required this.color,
    required this.image,
    required this.title,
  });
}

List<Pack> wraps = [
  Pack(
      id: 1,
      title: "Flower",
      price: 80,
      image: "assets/images/wrap1.png",
      color: const Color(0xFF3D82AE)),
];
