import 'package:flutter/material.dart';
import 'package:flutter_project_toko/providers/auth.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';

class ProductsOverviewScreen extends StatelessWidget {
String get ch {
  return ch.toString();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () => Provider.of<authan>(context, listen: false).logout(),
        ),
        title: Text('Shop Home'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return badge(
              child: ch!,
              value: value.jumlah.toString(), 
              color: Colors.amber,
              );
            },
            child: IconButton(icon: Icon(Icons.shopping_basket), onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ProductGrid(),
    );
  }
}
