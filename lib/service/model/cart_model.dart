class CartModel {
  final int id;
  final String title;
  final double price;
  final String image;
  final int quantity;
  final double newPrice;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.newPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      quantity: json['quantity'],
      newPrice: (json['newPrice'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "image": image,
      "quantity": quantity,
      "newPrice": newPrice,
    };
  }
}
