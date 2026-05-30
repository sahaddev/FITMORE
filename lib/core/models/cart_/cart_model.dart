
class CartModel {
    int id;
    String title;
    int price;
    String image;
    int quantity;
    int newPrice;

  CartModel({
    required this.newPrice,
    required this.quantity,
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
}
