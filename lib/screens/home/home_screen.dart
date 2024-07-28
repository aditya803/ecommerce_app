import 'package:ecommerce_app/extensions/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart'; // Import your ProductProvider
import 'product_list.dart'; // Import ProductList widget

class HomeScreen extends StatelessWidget {
  final bool remoteConfigService;
  static const routeName = '/home';

  HomeScreen({required this.remoteConfigService});

  @override
  Widget build(BuildContext context) {

    print("homescreen bool: $remoteConfigService");
    // Fetch products when the widget is built
    //print("hello this is what we are getting from firebase ${remoteConfigService.displayDiscountedPrice}");
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.fetchProducts(); // Ensure products are fetched

    return Scaffold(
      backgroundColor: Color(0xFFCED3DC),
      appBar: CommonAppbar(isHomeScreen: true),
      body: ProductList(showDiscount: remoteConfigService),
    );
  }
}
