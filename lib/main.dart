import 'dart:developer';
import 'package:fauna/Screens/Categories/gifts.dart';
import 'package:fauna/Screens/Details/shipping_details.dart';
import 'package:fauna/Screens/Details/user_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/Categories/favorite.dart';
import 'Screens/Categories/flowers.dart';
import 'Screens/Custom/custom_flower.dart';
import 'Screens/Home/home.dart';
import 'Screens/Login/login.dart';
import 'Screens/Login/signup.dart';
import 'Screens/Orders/cart.dart';
import 'Screens/Orders/order.dart';
import 'Screens/Services/auth.dart';
import 'Screens/welcome.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:provider/provider.dart';

import 'Screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(600),
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
        debugShowCheckedModeBanner: false,
        title: "Fauna",
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        // initialRoute: '/',
        home: Welcome(),
        routes: {
          // '/': (context) => Welcome(),
          '/wrapper': (context) => Wrapper(),
          '/login': (context) => Login(),
          '/signup': (context) => Signup(),
          '/home': (context) => Home(),
          '/gift': (context) => Gifts(),
          '/flower': (context) => Flowers(),
          '/favorite': (context) => Favorite(),
          '/cart': (context) => CartScreen(),
    //      '/shipping': (context) => Shipping(),
          '/order': (context) => Order(),
          '/customflower': (context) => CustomFlower(),
          '/userdetails': (context) => UserDetails(),
        },
      ),
    );
  }
}
