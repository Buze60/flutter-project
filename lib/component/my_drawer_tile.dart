// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';

/**
 DRAWER TILE 

 simple tile for each tile
 ______________________________
 to use this widget, you need to
  title (e.g 'Home')
  icon (e.g icon.home)
  function (e.g goToHomePage())
 */
class MyDrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const MyDrawerTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  //BUID UI
  @override
  Widget build(BuildContext context) {
    //List tile
    return ListTile(
      title: Text(title,
          style:
              TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      onTap: onTap,
    );
  }
}
