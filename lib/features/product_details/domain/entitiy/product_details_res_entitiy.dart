import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? sId;
  final int? id;
  final String? title;
  final String? subTitle;
  final String? description;
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
