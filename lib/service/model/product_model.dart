class Product {
  final int id;
  final String title;
  final String discription; // keeping your spelling
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final double price;
  final String category;
  final bool active;
  final int productCount;

  Product({
    required this.id,
    required this.title,
    required this.discription,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.price,
    required this.category,
    required this.active,
    required this.productCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      discription: json['discription'] ?? '',
      image1: json['image1'] ?? '',
      image2: json['image2'] ?? '',
      image3: json['image3'] ?? '',
      image4: json['image4'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      category: json['category'] ?? '',
      active: json['active'] ?? true,
      productCount: json['productCount'] ?? 0,
    );
  }
}
