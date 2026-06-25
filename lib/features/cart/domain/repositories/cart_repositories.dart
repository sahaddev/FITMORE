import '../entitiy/cart_res_entitiy.dart';

abstract class CartRepositories {
  Future<CartResEntity> addToCart({
    required String userId,
    required String productId,
    int quantity = 1,
  });

  Future<CartResEntity> getCart(String userId);

  Future<CartResEntity> removeFromCart({
    required String userId,
    required String productId,
  });

  Future<CartResEntity> clearCart(String userId);
}
