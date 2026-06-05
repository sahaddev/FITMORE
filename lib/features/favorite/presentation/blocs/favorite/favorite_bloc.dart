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
      // Just initialize with an empty list
      emit(const FavoriteState.loaded([]));
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }

  Future<void> _onGetAllFavorites(
    GetAllFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    List<FavoriteModel> currentFavorites = [];
    state.maybeWhen(
      loaded: (items) => currentFavorites = items,
      orElse: () {},
    );
    
    emit(const FavoriteState.loading());
    try {
      emit(FavoriteState.loaded(currentFavorites));
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }

  Future<void> _onRemoveFromFavorites(
    RemoveFromFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    List<FavoriteModel> currentFavorites = [];
    state.maybeWhen(
      loaded: (items) => currentFavorites = List.from(items),
      orElse: () {},
    );

    emit(const FavoriteState.loading());
    try {
      currentFavorites.removeWhere((item) => item.id == event.id);
      emit(const FavoriteState.success(message: 'Item removed from favorites'));
      emit(FavoriteState.loaded(currentFavorites));
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
      emit(const FavoriteState.success(message: 'All favorites cleared'));
      emit(const FavoriteState.loaded([]));
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }

  Future<void> _onAddToFavorites(
    AddToFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    List<FavoriteModel> currentFavorites = [];
    state.maybeWhen(
      loaded: (items) => currentFavorites = List.from(items),
      orElse: () {},
    );

    emit(const FavoriteState.loading());
    try {
      final existingIndex = currentFavorites.indexWhere((item) => item.id == event.item.id);
      if (existingIndex == -1) {
        currentFavorites.add(event.item);
        emit(const FavoriteState.success(message: 'Item added to favorites'));
      } else {
        emit(const FavoriteState.success(message: 'Item already in favorites'));
      }
      emit(FavoriteState.loaded(currentFavorites));
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }
}
