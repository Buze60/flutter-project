// ignore_for_file: must_be_immutable

import 'package:app/commponet/mybutton.dart';
import 'package:flutter/material.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  Dialogbox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[400],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: "Add new Task",
              ),
            ),
            //row of button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                Mybutton(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 20,
                ),
                //cancel button
                Mybutton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
