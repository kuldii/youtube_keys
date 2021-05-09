import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductItem extends StatefulWidget {
  ProductItem(this.prodId, this.title, this.date);

  final String prodId, title;

  final DateTime date;

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context, listen: false);
    return ListTile(
      leading: CircleAvatar(),
      title: Text("${widget.title}"),
      subtitle: Text(DateFormat.yMMMEd().format(widget.date)),
      trailing: IconButton(
        onPressed: () => products.deleteProduct(widget.prodId),
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
