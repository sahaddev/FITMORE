import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/favorite/favorite_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState.initial()) {
    on<LoadFavorite>(_onLoadFavorite);
    on<GetAllFavorites>(_onGetAllFavorites);
    on<RemoveFromFavorites>(_onRemoveFromFavorites);
    on<ClearFavorites>(_onClearFavorites);
    on<AddToFavorites>(_onAddToFavorites);
  }

  Future<void> _onLoadFavorite(
    LoadFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const FavoriteState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const FavoriteState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }

  Future<void> _onGetAllFavorites(
    GetAllFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const FavoriteState.loading());
    try {
      // TODO: Implement logic here
      emit(const FavoriteState.loaded([]));
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }

  Future<void> _onRemoveFromFavorites(
    RemoveFromFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const FavoriteState.loading());
    try {
      // TODO: Implement logic here
      emit(const FavoriteState.success(message: 'Item removed from favorites'));
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }

  Future<void> _onClearFavorites(
    ClearFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const FavoriteState.loading());
    try {
      // TODO: Implement logic here
      emit(const FavoriteState.success(message: 'All favorites cleared'));
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }

  Future<void> _onAddToFavorites(
    AddToFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const FavoriteState.loading());
    try {
      // TODO: Implement logic here
      emit(const FavoriteState.success(message: 'Item added to favorites'));
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }
}
