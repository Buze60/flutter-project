// ignore_for_file: camel_case_types

import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../compenent/shoes_tile.dart';
import '../models/shoes.dart';

class shopePage extends StatefulWidget {
  const shopePage({super.key});

  @override
  State<shopePage> createState() => _shopePageState();
}

class _shopePageState extends State<shopePage> {
  @override
  Widget build(BuildContext context) {
//adding item to the cart function
    void addShoeToCart(shoe) {
      Provider.of<Cart>(context, listen: false).addingItemToCart(shoe);

      //alert the user to adding item succefully
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Successfully added"),
          content: Text("check your cart"),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Consumer<Cart>(
          builder: (context, value, child) => Column(
            children: [
              // Search bar
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Search",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                    Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  "Every one flies, some fly longer than others.",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Hot Picks
                    Text(
                      "Hot Picks 🔥🔥🔥",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    // See More text
                    Text(
                      "See more",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // ListView of Shoes wrapped in Expanded to fit the remaining space
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value
                        .getShoeList()
                        .length, // Number of shoes (replace with dynamic data)
                    itemBuilder: (context, index) {
                      Shoe shoe = value.getShoeList()[index];
                      return ShoesTile(
                        shoe: shoe,
                        onTap: () => addShoeToCart(shoe),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Divider(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
