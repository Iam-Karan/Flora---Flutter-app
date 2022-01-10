import 'package:fauna/Model/cart.dart';
import 'package:fauna/Model/favorite_model.dart';
import 'package:fauna/Model/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ktxtColor = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.red,
  fontFamily: 'Ubuntu',
);
var txtQuntity = 1;

class CustomFlowerCard extends StatefulWidget {
  const CustomFlowerCard({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  _CustomFlowerCardState createState() => _CustomFlowerCardState();
}

class _CustomFlowerCardState extends State<CustomFlowerCard> {
  void addTocart() {
    print("Added to basket");
    // demoCarts.add(Cart(item: widget.item, numOfItem: txtQuntity));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 120.0,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(widget.item.image),
            ),
          ),
        ),
        SizedBox(
          width: size.width / 8,
        ),
        Column(
          children: [
            Text(
              widget.item.title,
              style: ktxtColor,
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${widget.item.price}",
                style: ktxtColor,
                children: [],
              ),
            ),
            SizedBox(height: 10),
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
                  fillColor: Colors.red,
                  child: Icon(
                    Icons.remove,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                Text(
                  "${txtQuntity}",
                  style: GoogleFonts.ubuntu(
                    fontSize: 15.0,
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
                  fillColor: Colors.red,
                  child: Icon(
                    Icons.add,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ],
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: addTocart,
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
