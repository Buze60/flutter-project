import 'package:advanced_ui/modes/product_model.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<ProductModel> _shop = [
    ProductModel(
      Name: "Product 1",
      Price: 65.7,
      description: "item description",
      imagePath: "assets/img/img4.jpg",
    ),
    ProductModel(
      Name: "Product 2",
      Price: 65.7,
      description: "item description",
      imagePath: "assets/img/img1.jpg",
    ),
    ProductModel(
      Name: "Product 3",
      Price: 65.7,
      description: "item description",
      imagePath: "assets/img/img2.jpg",
    ),
    ProductModel(
      Name: "Product 4",
      Price: 65.7,
      description: "item description",
      imagePath: "assets/img/img3.jpg",
    ),
  ];
  //user cart
  final List<ProductModel> _cart = [];

  //get product list
  List<ProductModel> get shop => _shop;

  //get user cart
  List<ProductModel> get cart => _cart;

  //add item to the cart
  void addToCart(ProductModel item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from the cart
  void removeFromCart(ProductModel item) {
    _cart.remove(item);
    notifyListeners();
  }
}
