import '../entitiy/favorite_res_entitiy.dart';

abstract class FavoriteRepositories {
  Future<FavoriteResEntity> addFavorite({
    required int userId,
    required String productId,
  });

  Future<FavoriteResEntity> getFavorites({
    required int userId,
  });

  Future<FavoriteResEntity> removeFavorite({
    required int userId,
    required String productId,
  });
}
