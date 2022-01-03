import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FlowerItem {
  String? image, title, description;
  int? price, id;
  String? color;
  bool? isFavorite;

  FlowerItem({
    this.isFavorite,
    this.price,
    this.id,
    this.color,
    this.image,
    this.title,
    this.description,
  });
}

class Item {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  final bool isFavorite;

  Item({
    required this.isFavorite,
    required this.price,
    required this.size,
    required this.id,
    required this.color,
    required this.image,
    required this.title,
    required this.description,
  });
}

List<FlowerItem> flowerItems = [];

class DatabaseManager {
  Future getItemList() async {
    final CollectionReference flowers =
        FirebaseFirestore.instance.collection('flowers');
    try {
      flowerItems.clear();
      var snapshot = await flowers.get();
      snapshot.docs.forEach((element) {
        Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
        if (data != null) {
          var itemEntity = FlowerItem();
          itemEntity.title = data['title'];
          itemEntity.isFavorite = data['isFavorite'];
          itemEntity.price = data['price'];
          itemEntity.image = data['image'];
          itemEntity.description = data['description'];
          itemEntity.id = data['id'];
          itemEntity.color = data['color'];
          flowerItems.add(itemEntity);
        } else {
          print("error:");
        }
      });
      return flowerItems;
    } catch (e) {
      print("Error : ${e.toString()}");
      return [];
    }
  }
}

List<Item> items = [
  Item(
      id: 1,
      title: "Flower",
      price: 80,
      size: 12,
      isFavorite: false,
      description: "Nice bouquet Flowers red roses ",
      image: "assets/images/item1.png",
      color: const Color(0xFF3D82AE)),
  Item(
      id: 2,
      title: "Toys",
      price: 70,
      size: 12,
      isFavorite: false,
      description: "Gift",
      image: "assets/images/img2.png",
      color: const Color(0xFFAEA33D)),
  Item(
      id: 3,
      title: "Perfumes",
      price: 40,
      isFavorite: false,
      size: 12,
      description:
          "A flower is the reproductive part of flowering plants. Flowers are also called the bloom or blossom of a plant. Flowers have petals.",
      image: "assets/images/img3.png",
      color: const Color(0xFFAA3DAE)),
  Item(
      id: 4,
      title: "Perfumes",
      price: 50,
      size: 12,
      isFavorite: false,
      description: "Gift",
      image: "assets/images/item1.png",
      color: const Color(0xFF523DAE)),
  Item(
      id: 5,
      title: "Perfumes",
      price: 30,
      size: 12,
      isFavorite: false,
      description: "Gift",
      image: "assets/images/img2.png",
      color: const Color(0xFF3DAE55)),
  Item(
      id: 6,
      title: "Perfumes",
      price: 50,
      size: 12,
      isFavorite: false,
      description: "Gift",
      image: "assets/images/img3.png",
      color: const Color(0xFFC2B039)),
];
