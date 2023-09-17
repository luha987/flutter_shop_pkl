// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_project_toko/providers/products.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product2.dart'; 
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Productt>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final productss = Provider.of<Products>(context, listen: false);
    print("WIDGET REBUILD");
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: productData.id,
              );
            },
            child: Image.network(
              productData.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Productt>(
            builder: (context, productData, child) => IconButton(
              icon: (productData.isFavorite) 
              ? Icon(Icons.favorite, color: Colors.amber,) 
              : Icon(Icons.favorite_border_outlined, color: Colors.red,),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                productData.statusFav();
              },
            ),
          ),
            title: Text(
              productData.title!,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Add to cart"),
                    duration: Duration(milliseconds: 500,
                    ),
                  ),
                );
                cart.addCart(
                  productData.id!, productData.title!, productData.price!
                );
                productss.addProduct(
                  productData.title!, productData.id!
                );
              },
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      );
  }
}
