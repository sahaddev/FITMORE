import 'package:hive_flutter/adapters.dart';
part 'order_history_model.g.dart';

@HiveType(typeId: 6)
class OrderhistoryModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String image;
  @HiveField(2)
  String title;
  @HiveField(3)
  num price;

  OrderhistoryModel(
      {required this.image, required this.title, required this.price, this.id});
}
