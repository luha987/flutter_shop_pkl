// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './providers/all_products.dart';
import './providers/cart.dart';

void main() {
  runApp(MyShop1());
}

class MyShop1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
        create: (context) => Products(),
        ),
     ],
     child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.blueAccent,
              onPrimary: Colors.white,
              secondary: Colors.green,
              onSecondary: Colors.red,
              error: Colors.grey,
              onError: Colors.blue,
              background: Colors.orange,
              onBackground: Colors.orange,
              surface: Colors.purpleAccent,
              onSurface: Colors.lime,
            ),
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
          },
        ),
    ); 
  }
}
