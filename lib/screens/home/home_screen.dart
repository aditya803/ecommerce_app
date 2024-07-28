import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/remote_config_service.dart';
import '../../providers/product_provider.dart'; // Import your ProductProvider
import 'product_list.dart'; // Import ProductList widget

class HomeScreen extends StatelessWidget {
  final RemoteConfigService remoteConfigService;

  static const routeName = '/home';

  HomeScreen({required this.remoteConfigService});

  @override
  Widget build(BuildContext context) {
    // Fetch products when the widget is built
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.fetchProducts(); // Ensure products are fetched

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ProductList(),
    );
  }
}
