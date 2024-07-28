import 'package:flutter/material.dart';
import '../models/product.dart';
import '../repos/product_repository.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository _productRepository = ProductRepository();
  List<Product> _products = [];
  bool showDiscountedPrice = false;

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await _productRepository.fetchProducts();
    notifyListeners();
  }

  void updateShowDiscountedPrice(bool value) {
    showDiscountedPrice = value;
    notifyListeners();
  }
}
