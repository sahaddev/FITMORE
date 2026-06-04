part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.load() = LoadFavorite;
  const factory FavoriteEvent.getAllFavorites() = GetAllFavorites;
  const factory FavoriteEvent.removeFromFavorites(int id) = RemoveFromFavorites;
  const factory FavoriteEvent.clearFavorites() = ClearFavorites;
  const factory FavoriteEvent.addToFavorites(FavoriteModel item) = AddToFavorites;
}
