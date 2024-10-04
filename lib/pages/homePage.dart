// ignore: file_names
// ignore_for_file: unused_field

import 'package:ecommerce/pages/cartPage.dart';
import 'package:ecommerce/pages/shopePage.dart';
import 'package:flutter/material.dart';

import '../compenent/bottom_nav_bar.dart';
import '../compenent/my_darwer_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //page to display
  final List<Widget> _Pages = [
    //shope Pag
    const shopePage(),
    //cart page
    Cartpage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onChanged: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(Icons.menu),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: const MyDrawerTile(),
      body: _Pages[_selectedIndex],
    );
  }
}
