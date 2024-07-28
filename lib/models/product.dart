class Product {
  final int id;
  final String title;
  final double price;
  final double discountPercentage;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.image,
  });

  double get discountedPrice {
    return price - (price * discountPercentage / 100);
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? 'Unknown Title',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      image: json['thumbnail'] as String? ?? '',
    );
  }
}
