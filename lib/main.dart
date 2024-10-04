import 'package:advanced_ui/modes/shop.dart';
import 'package:advanced_ui/pages/cart_page.dart';
import 'package:advanced_ui/pages/intro_page.dart';
import 'package:advanced_ui/pages/shop_page.dart';
import 'package:advanced_ui/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IntroPage(),
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      routes: {
        '/Intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const MyCartPage(),
      },
    );
  }
}
