part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.load() = LoadFavorite;
  const factory FavoriteEvent.getAllFavorites() = GetAllFavorites;
  const factory FavoriteEvent.removeFromFavorites(String id) = RemoveFromFavorites;
  const factory FavoriteEvent.addToFavorites(String productId) = AddToFavorites;
}
