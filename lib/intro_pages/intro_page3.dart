import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: const Center(
          child: Text(
        "Page 3",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
