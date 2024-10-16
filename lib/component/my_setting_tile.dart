import 'package:flutter/material.dart';
/*
             SETTING TILE
  this is the simple tile for each items in the setting page
    to use this tile ,you need to
       title (e.g " dark Mode")
       action (e.g toogleTheme)
 */

class MySettingTile extends StatelessWidget {
  final String title;
  final Widget action;
  //make the mode to required
  const MySettingTile({super.key, required this.action, required this.title});
  //BUILD UI
  @override
  Widget build(BuildContext context) {
    // container
    return Container(
      decoration: BoxDecoration(
          //color
          color: Theme.of(context).colorScheme.secondary,
          //curve the cornor
          borderRadius: BorderRadius.circular(12)),
      //padding to the outside
      margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
      //padding to the inside
      padding: const EdgeInsets.all(25),
      //Row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //title
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          //actio
          action,
        ],
      ),
    );
  }
}
