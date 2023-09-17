import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get jumlah {
    return _items.length;
    }

    double get totalHarga {
      var total =0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.qty * cartItem.price;
    });
    return total;
    }

  void addCart(String productId, String title, double price){
    if (_items.containsKey(productId)) {
      _items.update(productId, 
      (value) => CartItem(
        id: value.id, 
        price: value.price, 
        qty: value.qty + 1, 
        title: value.title,
        ),
      );
    } else {
      _items.putIfAbsent(productId, 
      () => CartItem(
        id: DateTime.now().toString(), 
        price: price, 
        qty: 1, 
        title: title,
        ),
      );
    }
    notifyListeners();
  }
}