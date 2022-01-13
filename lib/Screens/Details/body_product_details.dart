import 'package:fauna/Model/favorite_model.dart';
import 'package:fauna/Model/item.dart';
import 'package:fauna/Model/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

Color bgcolor = Colors.white;
var txtQuntity = 1;
const kbuttonLabel = TextStyle(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

class BodyOfDetailScreen extends StatefulWidget {
  final FlowerItem flowerItem;
  final Color colorcode;

  const BodyOfDetailScreen(
      {Key? key, required this.flowerItem, required this.colorcode})
      : super(key: key);

  @override
  _BodyOfDetailScreenState createState() => _BodyOfDetailScreenState();
}

class _BodyOfDetailScreenState extends State<BodyOfDetailScreen> {
  void addToCart() {
    print("Added");
    Fluttertoast.showToast(
        msg: "Product has been added",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    demoCarts.add(Cart(item: widget.flowerItem, numOfItem: txtQuntity));

    setState(() {
      txtQuntity = 1;
    });
  }

  void addToFavorite() {
    print("");
    Fluttertoast.showToast(
        msg: "Added to the favorite",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    favoriteCart.add(FavoriteCart(item: widget.flowerItem));
    setState(() {
      txtQuntity = 1;
    });
  }

  void removeFromFavorite() {
    print("Removed from the favorite");
    favoriteCart.removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            height: 250.0,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(widget.flowerItem.image.toString()),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.width / 4),
            width: double.infinity,
            height: 720.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0.0),
                  child: Column(
                    children: [
                      Container(
                        child: Icon(
                          Icons.remove,
                          size: 40.0,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        width: double.infinity,
                        child: Text(
                          widget.flowerItem.title.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 80.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                            color: Color(0xFFFCECFC),
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (bgcolor == Colors.white) {
                                  bgcolor = Colors.red;
                                  addToFavorite();
                                } else if (bgcolor == Colors.red) {
                                  bgcolor = Colors.white;
                                  removeFromFavorite();
                                }
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: bgcolor,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.0, top: 10.0),
                        width: double.infinity,
                        height: 100.0,
                        // color: Colors.grey,
                        child: Text(
                          widget.flowerItem.description.toString(),
                          style: GoogleFonts.ubuntu(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.0, top: 0),
                        width: double.infinity,
                        height: 50.0,
                        // color: Colors.grey,
                        child: Text(
                          "Price : \$ ${widget.flowerItem.price}",
                          style: GoogleFonts.ubuntu(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                if (txtQuntity > 1) {
                                  txtQuntity--;
                                }
                                ;
                              });
                            },
                            elevation: 2.0,
                            fillColor: widget.colorcode,
                            child: Icon(
                              Icons.remove,
                              size: 35.0,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                          Text(
                            "${txtQuntity}",
                            style: GoogleFonts.ubuntu(
                              fontSize: 22.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                txtQuntity++;
                              });
                            },
                            elevation: 2.0,
                            fillColor: widget.colorcode,
                            child: Icon(
                              Icons.add,
                              size: 35.0,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                        ],
                      ),
                      Container(
                        color: widget.colorcode,
                        margin:
                            EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: addToCart,
                          child: Text(
                            "Add to cart",
                            style: kbuttonLabel,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
