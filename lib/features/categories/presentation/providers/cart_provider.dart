import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:store/features/categories/domain/domain.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  UnmodifiableListView<Product> get cartItems =>
      UnmodifiableListView(_cartItems);

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  bool isInCart(Product product) {
    return _cartItems.contains(product);
  }

  int getItemCount(Product product) {
    return _cartItems.where((item) => item.id == product.id).length;
  }

 void removeFromCart(Product product) {
   int index = _cartItems.indexWhere((item) => item.id == product.id);
   if (index != -1) {
     _cartItems.removeAt(index);
     notifyListeners();
   }
 }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  int get totalItems => _cartItems.length;

  double get totalPrice =>
      _cartItems.fold(0, (total, item) => total + item.price);
}
