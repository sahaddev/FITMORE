import '../../domain/entitiy/cart_res_entitiy.dart';
import '../../domain/repositories/cart_repositories.dart';
import '../datasource/cart_datasource.dart';

class CartRepoImpl implements CartRepositories {
  final CartDatasource _datasource;

  CartRepoImpl(this._datasource);

  @override
  Future<CartResEntity> addToCart({
    required String userId,
    required String productId,
    int quantity = 1,
  }) async {
    final response = await _datasource.addToCart(
      userId: userId,
      productId: productId,
      quantity: quantity,
    );
    return response.toEntity();
  }

  @override
  Future<CartResEntity> getCart(String userId) async {
    final response = await _datasource.getCart(userId);
    return response.toEntity();
  }

  @override
  Future<CartResEntity> removeFromCart({
    required String userId,
    required String productId,
  }) async {
    final response = await _datasource.removeFromCart(
      userId: userId,
      productId: productId,
    );
    return response.toEntity();
  }

  @override
  Future<CartResEntity> clearCart(String userId) async {
    final response = await _datasource.clearCart(userId);
    return response.toEntity();
  }
}
