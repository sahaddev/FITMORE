class Favorite {
  final int id; // required
  final String title;
  final num price; // using num since Dart allows int/double
  final String image;

  Favorite({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
    };
  }
}
