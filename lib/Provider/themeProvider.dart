import 'package:ecommerce/Provider/darkMode.dart';
import 'package:ecommerce/Provider/lightMode.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light; // Default is light

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notifies UI to update the theme
  }

  ThemeData get themeData {
    if (_themeMode == ThemeMode.dark) {
      return ThemeData(
        primaryColor: DarkModeColors.primaryColor,
        colorScheme: const ColorScheme.dark(
          // Use ColorScheme for the dark theme
          primary: DarkModeColors.primaryColor,
          surface: DarkModeColors.backgroundColor,
          error: Colors.red, // Set your error color if needed
        ),
        scaffoldBackgroundColor: DarkModeColors.backgroundColor,
        // Additional dark theme settings can be added here
      );
    } else {
      return ThemeData(
        primaryColor: LightModeColors.primaryColor,
        colorScheme: const ColorScheme.light(
          // Use ColorScheme for the light theme
          primary: LightModeColors.primaryColor,
          surface: LightModeColors.backgroundColor,
          error: Colors.red, // Set your error color if needed
        ),
        scaffoldBackgroundColor: LightModeColors.backgroundColor,
        // Additional light theme settings can be added here
      );
    }
  }
}
