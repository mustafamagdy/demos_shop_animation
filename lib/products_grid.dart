import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './constants.dart';
import './models/Product.dart';
import './providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            mainAxisSpacing: kDefaultPadding,
            crossAxisSpacing: kDefaultPadding,
          ),
          itemBuilder: (ctx, idx) {
            return ChangeNotifierProvider.value(
              value: products[idx],
              child: ProductItem(),
            );
          },
          itemCount: products.length,
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(kDefaultPadding * 1.25),
        ),
        color: Colors.black.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(product.name),
            Text('is watched ${product.watched}'),
            IconButton(
              onPressed: () {
                product.toggleWatched();
                Provider.of<Products>(context, listen: false).updateCounts();
              },
              icon: Icon(
                product.watched
                    ? Icons.mark_email_unread
                    : Icons.mark_email_read,
              ),
            )
          ],
        ),
      ),
    );
  }
}
