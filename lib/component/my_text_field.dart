import 'package:flutter/material.dart';

/*
    TEXT FIELD
    this text field is the box that the user can type into
    ___________________________________________________________
    -text controller (to access what the user types into)
    -hint text (e.g "Enter the password")
    -obscure text (e.g true -> hide the password *********)
    -suffix icon (e.g to show/hide the password)
 */

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconButton? suffixIcon; // Make suffixIcon optional

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon, // Add suffixIcon as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        // Border when unselected
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        // Border when selected
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        suffixIcon: suffixIcon, // Add the suffixIcon here
      ),
    );
  }
}
