import 'package:ecommerce/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure you import provider package

import '../Provider/themeProvider.dart'; // Adjust this path based on your structure

class MyDrawerTile extends StatelessWidget {
  const MyDrawerTile({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the theme provider
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Function for navigation to the pages
    void homeNavigation() {
      // Pop the drawer page
      Navigator.pop(context);
      // Navigate to the home page
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Logo
              DrawerHeader(
                child: Image.asset(
                  "assets/image/nike_logo.jpg",
                ),
              ),
              // Divider
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              // Home tile
              GestureDetector(
                onTap: homeNavigation,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: Text(
                      "H o m e",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              // About tile
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close drawer before navigating
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const About()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: Text(
                      "A b o u t",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              // Light/Dark Mode Toggle
              SwitchListTile(
                title: Text(
                  "Dark Mode",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                secondary: Icon(
                  themeProvider.themeMode == ThemeMode.dark
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              ),
            ],
          ),
          // Logout
          Padding(
            padding: EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                "L o g o u t",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
