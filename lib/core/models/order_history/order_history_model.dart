class OrderhistoryModel {
  int? id;
  String image;
  String title;
  num price;

  OrderhistoryModel({
    required this.image,
    required this.title,
    required this.price,
    this.id,
  });
}
