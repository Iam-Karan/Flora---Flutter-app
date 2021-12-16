import 'package:fauna/Screens/Details/user_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraWer extends StatefulWidget {
  const DraWer({Key? key}) : super(key: key);

  @override
  _DraWerState createState() => _DraWerState();
}

class _DraWerState extends State<DraWer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  icon: Icon(
                    Icons.perm_identity,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Nisarg Patel",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.perm_identity),
            title: Text('User'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => User(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
            onTap: () {
              Navigator.pushNamed(context, '/order');
            },
          ),
        ],
      ),
    );
  }
}
