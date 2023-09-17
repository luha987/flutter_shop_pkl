import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cart_screen.dart';
import '../widgets/badge.dart';
import '../providers/all_products.dart';
import '../providers/cart.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Product Details'),
        centerTitle: true,
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
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.cover,
              ),
          ),
          SizedBox(height: 30),
          Text("${product.title}",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(height: 30),
          Text("\$${product.price}",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(height: 30),
          Text("${product.description}",
          style: TextStyle(
            fontSize: 20,
          ),
          ),
          SizedBox(height: 35),
          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Add to cart"),
                    duration: Duration(milliseconds: 500,
                    ),
                  ),
                );
                cart.addCart(
                  product.id!, product.title!, product.price!
                );
            }, 
            child: Text(
              "Add to Troli",
              style: TextStyle(
                fontSize: 20,
          ),
            ),
          ),
        ],
      ),
    );
  }
}
