import '../entitiy/favorite_res_entitiy.dart';
import '../repositories/favorite_repositories.dart';
import '../../data/repositories_impl/favorite_repo_impl.dart';

class FavoriteUsecase {
  FavoriteRepositories favoriteRepositories = FavoriteRepoImpl();

  Future<FavoriteResEntity> addFavorite({
    required int userId,
    required String productId,
  }) {
    return favoriteRepositories.addFavorite(
      userId: userId,
      productId: productId,
    );
  }

  Future<FavoriteResEntity> getFavorites({
    required int userId,
  }) {
    return favoriteRepositories.getFavorites(
      userId: userId,
    );
  }

  Future<FavoriteResEntity> removeFavorite({
    required int userId,
    required String productId,
  }) {
    return favoriteRepositories.removeFavorite(
      userId: userId,
      productId: productId,
    );
  }
}
