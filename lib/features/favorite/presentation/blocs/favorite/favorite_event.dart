part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.load() = LoadFavorite;
}
