import 'package:flutter/material.dart';
import 'package:light_dark/component/button.dart';
import 'package:light_dark/component/my_box.dart';
import 'package:light_dark/component/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
//function to toggle between the theme
  void togleForTheme(BuildContext context) {
    Provider.of<ThemeProvider>(context, listen: false).toogletheme();
  }

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: MyBox(
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: Button(
              onTap: () => togleForTheme(context),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
