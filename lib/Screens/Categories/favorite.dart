import 'package:fauna/Model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'favorite_card.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OutlineSearchBar(
            margin: EdgeInsets.all(15.0),
            hintStyle: TextStyle(fontSize: 16.0, color: Colors.black),
            hintText: 'search',
            borderColor: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            textStyle: TextStyle(fontSize: 16.0, color: Colors.black),
            borderWidth: 2.0,
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
