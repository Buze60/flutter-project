import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0; //initialize the value
  // get current data
  get count => _count;

  void counter() {
    _count++;
    notifyListeners();
  }
}
