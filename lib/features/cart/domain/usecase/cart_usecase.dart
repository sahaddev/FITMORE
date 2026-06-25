import '../entitiy/cart_res_entitiy.dart';
import '../repositories/cart_repositories.dart';

class AddToCartUseCase {
  final CartRepositories repository;

  AddToCartUseCase(this.repository);

  Future<CartResEntity> call({
    required String userId,
    required String productId,
    int quantity = 1,
  }) async {
    return await repository.addToCart(
      userId: userId,
      productId: productId,
      quantity: quantity,
    );
  }
}

class GetCartUseCase {
  final CartRepositories repository;

  GetCartUseCase(this.repository);

  Future<CartResEntity> call(String userId) async {
    return await repository.getCart(userId);
  }
}

class RemoveFromCartUseCase {
  final CartRepositories repository;

  RemoveFromCartUseCase(this.repository);

  Future<CartResEntity> call({
    required String userId,
    required String productId,
  }) async {
    return await repository.removeFromCart(
      userId: userId,
      productId: productId,
    );
  }
}

class ClearCartUseCase {
  final CartRepositories repository;

  ClearCartUseCase(this.repository);

  Future<CartResEntity> call(String userId) async {
    return await repository.clearCart(userId);
  }
}
