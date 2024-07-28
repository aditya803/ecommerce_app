import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../providers/product_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final bool showDiscount;

  ProductItem(this.product, this.showDiscount);

  @override
  Widget build(BuildContext context) {

    print((product.price - (product.price * product.discountPercentage/100)));
    final price = showDiscount ? product.discountedPrice : product.price;
    print(showDiscount);
    print("this is the discounted price: $price and this is the normal price: ${product.price}");
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4.0),

              child: showDiscount?Row(
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
                    '${product.discountPercentage.toStringAsFixed(2)}%',
                    style: TextStyle(color: Colors.green,fontStyle: FontStyle.italic),
                  ),
                ],
              ):Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${product.discountPercentage.toStringAsFixed(2)}%',
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
