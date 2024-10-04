import 'package:ecommerce/pages/about.dart';
import 'package:ecommerce/pages/shopePage.dart';
import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  const MyDrawerTile({super.key});

  @override
  Widget build(BuildContext context) {
//function for navigate to the pages
    void homeNavigation() {
      //pop the drawer page
      Navigator.pop(context);
      //navigate the page to the home page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const shopePage()),
      );
    }

    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              DrawerHeader(
                child: Image.asset(
                  "assets/image/nike_logo.jpg",
                ),
              ),
              //divider
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Divider(
                  color: Colors.grey[800],
                ),
              ),
              //home tile
              GestureDetector(
                onTap: homeNavigation,
                child: const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "H o m e",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              //about tile
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      "A b o u t",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //logout
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "L o g o u t",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
