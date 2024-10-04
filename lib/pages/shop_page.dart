import 'package:advanced_ui/component/my_drawer.dart';
import 'package:advanced_ui/component/product_tile.dart';
import 'package:advanced_ui/modes/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access product inthe shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Shop Page"),
          actions: [
            //go to the cart button
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.add_shopping_cart_outlined))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            //sub title
            Center(
              child: Text(
                "pick from selected premium product",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            SizedBox(
              height: 550,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  //get each individual product
                  final product = products[index];

                  //retrun as product tile UI
                  return ProductTile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
