// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pro/theme/Light_mode.dart';
import 'package:pro/theme/dark_mode.dart';

/*

THEME PROVIDER
This helps us to change from light and dark mode.

*/
class Themeprovider with ChangeNotifier {
  // Initially set the light mode
  ThemeData _themeData = lightMode;

  // Get the current theme
  ThemeData get themeData => _themeData;

  // Check if it's dark mode
  bool get isDarkMode => _themeData == darkMode;

  // Set the theme data
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    // Update the UI
    notifyListeners();
  }

  // Toggle between dark and light mode
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode; // Set to dark mode
    } else {
      themeData = lightMode; // Set to light mode
    }
  }
}
