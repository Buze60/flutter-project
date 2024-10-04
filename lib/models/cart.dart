import 'package:ecommerce/models/shoes.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  //list of shoe for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: "Air Jordand",
        price: "\$332",
        description: "it is supper awosome for basketbool player",
        imagepath: "assets/image/shoeas_1.jpg"),
    Shoe(
        name: "ADIDAS",
        price: "\$399",
        description: "it is supper awosome",
        imagepath: "assets/image/adidas.jpg"),
    Shoe(
        name: "Nike AIRFORCE",
        price: "\$258",
        description: "it is feel fly like birds",
        imagepath: "assets/image/shoeas_2.jpg"),
    Shoe(
        name: "NIKE Boots",
        price: "\$578",
        description: "make a grace for your drassing stayle",
        imagepath: "assets/image/shoeas_3.jpg"),
  ];
  //list of item in the cart
  List<Shoe> userCart = [];
  //get list of shoe for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get the cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add item to the cart
  void addingItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item fromthe cart
  void removeItemFromCart(Shoe sheo) {
    userCart.remove(sheo);
    notifyListeners();
  }
}
