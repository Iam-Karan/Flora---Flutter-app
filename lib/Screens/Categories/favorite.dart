import 'package:fauna/Model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'favorite_card.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          itemCount: favoriteCart.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  favoriteCart.removeAt(index);
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
              child: FavroiteCard(
                favorite: favoriteCart[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
