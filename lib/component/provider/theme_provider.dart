import 'package:flutter/material.dart';
import 'package:light_dark/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData; //used to access the current theme

  set themeData(ThemeData themeData) {
    _themeData = themeData; //setter to update the current theme
    notifyListeners();
  }

  //toogle between the light mode to dark mode
  void toogletheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
