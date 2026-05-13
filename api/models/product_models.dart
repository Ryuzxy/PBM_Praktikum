class Product {
  final int id;
  final String name;
  final dynamic price; 
  final String description;
  final String createdAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
