// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onChanged;
  BottomNavBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
          gap: 8,
          color: Colors.grey[400],
          activeColor: Colors.grey.shade700,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade100,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          tabBorderRadius: 12,
          onTabChange: (value) => onChanged!(value),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Shop",
              textSize: 20,
            ),
            GButton(
              icon: Icons.shop_2_outlined,
              text: "Cart",
              textSize: 20,
            ),
          ]),
    );
  }
}
