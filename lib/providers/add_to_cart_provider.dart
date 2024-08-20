import 'package:eshop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  double _netPayAfterDiscount = 0.0;
  double get netPayAfterDiscount => _netPayAfterDiscount;

  void addProductToCart(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  // to increment
  incrementQty(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  // to decrement
  decrementQty(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
    }
    notifyListeners();
  }

  // total amount
  totalPrice() {
    double myTotal = 0.0;
    for (Product product in _cart) {
      myTotal += product.price * product.quantity;
    }
    _netPayAfterDiscount = myTotal;
    return myTotal;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
