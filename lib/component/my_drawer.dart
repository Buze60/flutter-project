// ignore_for_file: non_constant_identifier_names

import 'package:advanced_ui/component/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //Drawer header:logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 90,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              //Shop tile
              const SizedBox(
                height: 20,
              ),
              MyListTile(
                text: "S h o p",
                icon: const Icon(
                  Icons.home,
                ),
                //Navigate to the home page
                onTap: () => Navigator.pop(context),
              ),
              MyListTile(
                text: "C a r t",
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                onTap: () {
                  //pop the drower
                  Navigator.pop(context);

                  //navigate to the cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              text: "E i x t",
              icon: const Icon(
                Icons.logout_outlined,
              ),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  // ignore: avoid_types_as_parameter_names
                  context,
                  '/Intro_page',
                  // ignore: avoid_types_as_parameter_names
                  (Route) => false),
            ),
          )
        ],
      ),
    );
  }
}
