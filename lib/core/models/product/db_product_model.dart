
class ProductModel {
    int? id;
    String? sId;
    final String title;
    final String discription;
    final String image1;
    final String image2;
    final String image3;
    final String image4;
    final int price;
    final String category;
    bool? active;
    int productCount;

  ProductModel({
    required this.title,
    required this.discription,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.price,
    required this.category,
    required this.productCount,
    this.id,
    this.sId,
    this.active = true,
  });
}
