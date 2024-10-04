import 'package:flutter/material.dart';

class MyBox extends StatefulWidget {
  final Widget? child;
  final Color? color;
  MyBox({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  State<MyBox> createState() => _MyBoxState();
}

class _MyBoxState extends State<MyBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(50),
      child: widget.child,
    );
  }
}
