import 'package:flutter/material.dart';
import 'product2.dart';
import 'dart:math';

class Products with ChangeNotifier {
  List<Productt> _allproducts = List.generate(
    25,
    (index) {
      return Productt(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  List<Productt> get allproducts {
    return _allproducts;
  }

  Productt findById(productId) {
    return _allproducts.firstWhere((prodId) => prodId.id == productId);
  }

}