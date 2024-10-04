import 'package:advanced_ui/modes/product_model.dart';
import 'package:advanced_ui/modes/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
//get instance of the product model
  final ProductModel product;
  //add to the cart list method
  void addToCart(BuildContext context) {
//show the dialogbox to ask user to confirm to add to the cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add this item to your the cart?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          //yes button
          MaterialButton(
            onPressed: () {
              //pop the dialog box
              Navigator.pop(context);

              //add to the cart
              context.read<Shop>().addToCart(product);
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              //prodcut image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(product.imagePath),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //prodcut name
              Text(
                product.Name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //product decription
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          //prodcut price + add to  cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // price for the product
              Text(product.Price.toStringAsFixed(2)),
              //button got adding to the cart
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
