import 'package:flutter/material.dart';
import 'package:flutter_project_toko/pages/auth_page.dart';
import 'package:provider/provider.dart';
import '../../providers/products.dart';
import '../providers/cart.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/Cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    final deleteData = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Text("Total : \$${cartData.totalHarga}", style: TextStyle(fontSize: 35),),
              ),
          ),
          Expanded(child: ListView.builder(
            itemCount: cartData.items.length,
            itemBuilder:(context, index) {
            return ListTile(
              title: Text("${cartData.items.values.toList()[index].title}"),
              subtitle: Text("Quantity : ${cartData.items.values.toList()[index].qty}", style: TextStyle()),
              leading:Text(
                "\$ ${cartData.items.values.toList()[index].qty * cartData.items.values.toList()[index].price}", style: TextStyle(height: 1.5, fontWeight: FontWeight.bold, fontSize: 23),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  String id = "";
                  deleteP(deleteData, id);
                },
              ),
            );
          },
          ),
          ),
        ],
      ),
    );
  }

  void deleteP(Products deleteData, String id) => deleteData.deleteProduct(id, String);
}