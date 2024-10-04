import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final Icon icon;
  void Function()? onTap;
  MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        leading: icon,
        iconColor: Colors.grey,
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
