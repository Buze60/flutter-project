import 'package:advanced_ui/component/my_button.dart';
import 'package:advanced_ui/modes/product_model.dart';
import 'package:advanced_ui/modes/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  // Remove from the user cart
  void removeFromCart(BuildContext context, ProductModel product) {
    // Show the dialog box to ask the user to confirm removal
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
            "Are you sure you want to remove the item from the cart?"),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          // Yes button
          MaterialButton(
            onPressed: () {
              // Pop the dialog box
              Navigator.pop(context);

              // Remove the item from the cart
              context
                  .read<Shop>()
                  .removeFromCart(product); // Corrected to use 'product'
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

//user pressed pay button
  void payButtonpressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text("user want to pay! connect you payment backend"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // Get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("your cart is empty!"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // Get each individual item
                      final item = cart[index];

                      // Return a ListTile for each item
                      return ListTile(
                        title: Text(item.Name),
                        subtitle: Text(item.description),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeFromCart(
                              context, item), // Correctly passing 'item'
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
              onTap: () => payButtonpressed(context),
              child: cart.isNotEmpty
                  ? const Text("PAY NOW")
                  : GestureDetector(
                      onTap: () {
                        // Navigator.push(context, '/');
                      },
                      child: const Text(
                        "nothing is there!",
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
