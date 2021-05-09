import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductItem extends StatelessWidget {
  ProductItem(this.prodId, this.title, this.date);

  final String prodId, title;

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context, listen: false);
    return ListTile(
      leading: CircleAvatar(),
      title: Text("$title"),
      subtitle: Text(DateFormat.yMMMEd().format(date)),
      trailing: IconButton(
        onPressed: () => products.deleteProduct(prodId),
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
