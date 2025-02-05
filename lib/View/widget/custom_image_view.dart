import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final double height;
  final double width;
  final String? image;
  final Color color;

  const CustomImageView({
    super.key,
    required this.height,
    required this.width,
     this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
       
      ),
    );
  }
}
