import 'package:fauna/Model/cart.dart';
import 'package:fauna/Screens/Categories/favorite.dart';
import 'package:fauna/Screens/Categories/flowers.dart';
import 'package:fauna/Screens/Categories/gifts.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

const Color activeColor = Colors.red;
const Color inactiveColor = Colors.black38;
const List<Widget> _widgetOptions = <Widget>[
  Gifts(),
  Flowers(),
  Favorite(),
];

const titleLabel = TextStyle(
  color: Colors.red,
  fontSize: 35.0,
  fontFamily: 'Satisfy',
);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var cart = CartModel();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        title: Text(
          'Flora',
          style: GoogleFonts.ubuntu(
            fontSize: 40.0,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 3, end: 18),
            animationDuration: Duration(milliseconds: 100),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              '${demoCarts.length}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                padding: EdgeInsets.only(right: 30.0),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                }),
          ),
        ],
      ),
      drawer: DraWer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(
            color: activeColor, fontSize: 15.0, fontFamily: 'Satisfy'),
        selectedIconTheme: IconThemeData(color: activeColor),
        unselectedLabelStyle: TextStyle(
            color: inactiveColor, fontSize: 15.0, fontFamily: 'Satisfy'),
        unselectedIconTheme: IconThemeData(color: inactiveColor),
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard,
                size: 40,
              ),
              label: 'Gift'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.filter_vintage,
                size: 40,
              ),
              label: 'Flower'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 40,
              ),
              label: 'Favorite'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
