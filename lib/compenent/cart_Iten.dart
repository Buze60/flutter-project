// ignore_for_file: camel_case_types, must_be_immutable

import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cartItem extends StatefulWidget {
  Shoe shoe;
  cartItem({
    super.key,
    required this.shoe,
  });

  @override
  State<cartItem> createState() => _cartItemState();
}

class _cartItemState extends State<cartItem> {
  //used to remove the the shoe list in the cart
  void removeFormTheCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
          leading: Image.asset(widget.shoe.imagepath),
          title: Text(widget.shoe.name),
          subtitle: Text(widget.shoe.price),
          trailing: IconButton(
            onPressed: removeFormTheCart,
            icon: const Icon(Icons.delete),
          )),
    );
  }
}
