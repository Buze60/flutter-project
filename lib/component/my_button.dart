import 'package:flutter/material.dart';

/*
      SIMPLE BUTTON

  to use this widget you need to
  -text
  -funtion (e.g onTap)
  -
 */
class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});
  //BUILD UI
  @override
  Widget build(BuildContext context) {
    //GUESTURE DETECTURE
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //padding inside
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            //colo of the button
            color: Theme.of(context).colorScheme.secondary,
            //curved corner
            borderRadius: BorderRadius.circular(12)),

        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
    );
  }
}
