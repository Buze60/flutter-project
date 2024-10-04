import 'package:ecommerce/Provider/themeProvider.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/pages/introPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (context) => Cart()), // Providing Cart here
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode:
          themeProvider.themeMode, // Use the theme mode from ThemeProvider
      home: const IntroPage(), // Your starting page
    );
  }
}
