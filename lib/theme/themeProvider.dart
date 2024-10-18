// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pro/theme/Light_mode.dart';
import 'package:pro/theme/dark_mode.dart';

/*

THEME PROVIDER
this helps us to change from light and dark mode

 */
class Themeprovider with ChangeNotifier {
  //initially set the light mode
  ThemeData _themeData = lightMode;

  //get the current theme
  ThemeData get themeData => _themeData;

  // is it dark mode
  bool get isDarMode => _themeData == darkMode;

  // set the themedata
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    //update the UI
    notifyListeners();
  }

  //toggle between dark and light mode
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
