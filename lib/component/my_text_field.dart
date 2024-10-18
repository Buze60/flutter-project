import 'package:flutter/material.dart';

/*
    TEXT FIELD
    this text field is the box that the user can type into
    ___________________________________________________________
    -text controller (to acces what the user type into)
    -hint text (e.g "Enter the password")
    -obscure text (e.g true -> hide the password *********)

 */

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscuretext;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
          //border when unselected
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
              )),
          //border when selected
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              )),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)),
    );
  }
}
