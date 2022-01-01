import 'package:fauna/Model/user.dart';
import 'package:fauna/Screens/Details/user_details.dart';
import 'package:fauna/Screens/Services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DraWer extends StatefulWidget {
  const DraWer({Key? key}) : super(key: key);

  @override
  _DraWerState createState() => _DraWerState();
}

class _DraWerState extends State<DraWer> {
  UserAttributes? userAttributes;
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
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
                    Navigator.pushNamed(context, '/wrapper');
                  },
                  icon: Icon(
                    Icons.perm_identity,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "user",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await authService.signOut();
                    Navigator.pushNamed(context, '/home');
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 20.0,
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
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Customize flower'),
            onTap: () {
              Navigator.pushNamed(context, '/customflower');
            },
          ),
        ],
      ),
    );
  }
}
