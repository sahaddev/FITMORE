class OrderHistoryModel {
  final int? id; // optional
  final String image;
  final String title;
  final double price;

  OrderHistoryModel({
    this.id,
    required this.image,
    required this.title,
    required this.price,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "title": title,
      "price": price,
    };
  }
}
