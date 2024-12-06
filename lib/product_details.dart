import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products_provider.dart';
import 'models/Product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(product.name),
          IconButton(
            icon: Icon(Icons.mark_chat_read),
            onPressed: () {
              Provider.of<Product>(context, listen: false).toggleWatched();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
