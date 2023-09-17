import 'package:flutter/material.dart';
import 'package:flutter_project_toko/shop/shop.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInit = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Products>(context);
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.logout),
      //     onPressed: () => Provider.of<authan>(context, listen: false).logout(),
      //   ),
      //   title: Text("All Products"),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.add),
      //       onPressed: () => Navigator.pushNamed(context, AddProductPage.route),
      //     ),
      //   ],
      // ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (prov.allProduct.length == 0)
              ? Center(
                child: MyShop1(),
                )
              : ListView.builder(
                  itemCount: prov.allProduct.length,
                  itemBuilder: (context, i) => ProductItem(
                    prov.allProduct[i].id,
                    prov.allProduct[i].title,
                    prov.allProduct[i].price,
                    prov.allProduct[i].updatedAt,
                  ),
                ),
    );
  }
}
