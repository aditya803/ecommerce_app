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

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough,fontStyle: FontStyle.italic),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '\$${product.discountedPrice.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.green,fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
