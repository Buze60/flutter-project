import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color? color;
  final Function()? onTap;
  const Button({
    super.key,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text("TAP"),
          ),
        ),
      ),
    );
  }
}
