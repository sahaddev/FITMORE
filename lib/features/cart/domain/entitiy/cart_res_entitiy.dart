import 'package:equatable/equatable.dart';

class CartProductEntity extends Equatable {
  final String? id;
  final dynamic productId; // Can be a string ID or populated product map/object
  final int quantity;

  const CartProductEntity({
    this.id,
    required this.productId,
    this.quantity = 1,
  });

  @override
  List<Object?> get props => [id, productId, quantity];
}

class CartEntity extends Equatable {
  final String? id;
  final String userId;
  final List<CartProductEntity> products;

  const CartEntity({
    this.id,
    required this.userId,
    required this.products,
  });

  @override
  List<Object?> get props => [id, userId, products];
}

class CartResEntity extends Equatable {
  final bool status;
  final String? message;
  final CartEntity? cart;

  const CartResEntity({
    required this.status,
    this.message,
    this.cart,
  });

  @override
  List<Object?> get props => [status, message, cart];
}
