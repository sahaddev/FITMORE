part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = _Loading;
  const factory FavoriteState.success({required String message}) = _Success;
  const factory FavoriteState.failure({required String message}) = _Failure;
}
