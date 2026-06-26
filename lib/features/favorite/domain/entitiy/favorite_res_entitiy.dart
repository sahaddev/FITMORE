import 'package:equatable/equatable.dart';
import '../../../../features/product_details/domain/entitiy/product_details_res_entitiy.dart';

class FavoriteProductEntity extends Equatable {
  final String? id;
  final ProductEntity? product;

  const FavoriteProductEntity({
    this.id,
    this.product,
  });

  @override
  List<Object?> get props => [id, product];
}

class FavoriteEntity extends Equatable {
  final String? id;
  final int? userId;
  final List<FavoriteProductEntity>? products;

  const FavoriteEntity({
    this.id,
    this.userId,
    this.products,
  });

  @override
  List<Object?> get props => [id, userId, products];
}

class FavoriteResEntity extends Equatable {
  final bool status;
  final String? message;
  final FavoriteEntity? favorite;

  const FavoriteResEntity({
    required this.status,
    this.message,
    this.favorite,
  });

  @override
  List<Object?> get props => [status, message, favorite];
}
