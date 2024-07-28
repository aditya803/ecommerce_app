import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../providers/product_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    final showDiscountedPrice = Provider.of<ProductProvider>(context).showDiscountedPrice;
    final price = showDiscountedPrice ? product.discountedPrice : product.price;

    return Card(
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            child: product.image.isNotEmpty
                ? Image.network(product.image, fit: BoxFit.cover)
                : Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
