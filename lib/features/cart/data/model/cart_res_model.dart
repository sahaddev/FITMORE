import '../../domain/entitiy/cart_res_entitiy.dart';

class CartProductModel extends CartProductEntity {
  const CartProductModel({
    super.id,
    required super.productId,
    super.quantity = 1,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['_id']?.toString(),
      productId: json['productId'], // Can be string or populated object
      quantity: json['quantity'] ?? 1,
    );
  }

  CartProductEntity toEntity() {
    return CartProductEntity(
      id: id,
      productId: productId,
      quantity: quantity,
    );
  }
}

class CartModel extends CartEntity {
  const CartModel({
    super.id,
    required super.userId,
    required super.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['_id']?.toString(),
      userId: json['userId']?.toString() ?? '',
      products: json['products'] != null
          ? List<CartProductEntity>.from(
              (json['products'] as List).map((x) => CartProductModel.fromJson(x)))
          : [],
    );
  }

  CartEntity toEntity() {
    return CartEntity(
      id: id,
      userId: userId,
      products: products,
    );
  }
}

class CartResModel extends CartResEntity {
  const CartResModel({
    required super.status,
    super.message,
    super.cart,
  });

  factory CartResModel.fromJson(Map<String, dynamic> json) {
    return CartResModel(
      status: json['status'] ?? false,
      message: json['message'],
      cart: json['cart'] != null ? CartModel.fromJson(json['cart']) : null,
    );
  }

  CartResEntity toEntity() {
    return CartResEntity(
      status: status,
      message: message,
      cart: cart,
    );
  }
}
