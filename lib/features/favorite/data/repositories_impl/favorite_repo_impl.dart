import '../../domain/entitiy/favorite_res_entitiy.dart';
import '../../domain/repositories/favorite_repositories.dart';
import '../datasource/favorite_datasource.dart';

class FavoriteRepoImpl implements FavoriteRepositories {
  FavoriteDatasource favoriteDatasource = FavoriteDatasourceImpl();

  @override
  Future<FavoriteResEntity> addFavorite({
    required int userId,
    required String productId,
  }) {
    return favoriteDatasource
        .addFavorite(
          userId: userId,
          productId: productId,
        )
        .then((value) => value.toEntity());
  }

  @override
  Future<FavoriteResEntity> getFavorites({
    required int userId,
  }) {
    return favoriteDatasource
        .getFavorites(userId: userId)
        .then((value) => value.toEntity());
  }

  @override
  Future<FavoriteResEntity> removeFavorite({
    required int userId,
    required String productId,
  }) {
    return favoriteDatasource
        .removeFavorite(
          userId: userId,
          productId: productId,
        )
        .then((value) => value.toEntity());
  }
}
