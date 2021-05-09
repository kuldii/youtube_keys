import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../pages/add_product_page.dart';
import '../widgets/product_item.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  final List<Color> availableColor = [
    Colors.amber,
    Colors.black,
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    print("build()");
    var products = Provider.of<Products>(context);
    var allProducts = products.allProducts;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.pushNamed(context, AddProductPage.routeName),
          ),
        ],
      ),
      body: (allProducts.length == 0)
          ? Center(
              child: Text(
                "No Data",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          : ListView.builder(
              itemCount: allProducts.length,
              itemBuilder: (context, i) {
                return ProductItem(
                  allProducts[i].id,
                  allProducts[i].title,
                  allProducts[i].date,
                  availableColor[Random().nextInt(availableColor.length)],
                );
              },
            ),
    );
  }
}
