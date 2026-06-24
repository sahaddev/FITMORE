import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? sId;
  final int? id;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final int? price;
  final String? category;
  final bool? active;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  const ProductEntity({
    required this.sId,
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.price,
    required this.category,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
  });

  @override
  List<Object?> get props => [
        sId,
        id,
        title,
        subTitle,
        description,
        image1,
        image2,
        image3,
        image4,
        price,
        category,
        active,
        createdAt,
        updatedAt,
        iV,
      ];
}

class ProductDetailsResEntitiy extends Equatable {
  final bool? status;
  final ProductEntity? product;

  const ProductDetailsResEntitiy({
    required this.status,
    required this.product,
  });

  @override
  List<Object?> get props => [status, product];
}
