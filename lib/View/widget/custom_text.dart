import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;
  final double size;

  const Customtext({
    super.key,
    required this.text,
    required this.color,
    required this.weight,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
