import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../favorite/domain/usecase/favorite_usecase.dart';
import '../../../../favorite/domain/entitiy/favorite_res_entitiy.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteUsecase favoriteUsecase;

  FavoriteBloc({required this.favoriteUsecase}) : super(const FavoriteState.initial()) {
    on<LoadFavorite>(_onLoadFavorite);
    on<GetAllFavorites>(_onGetAllFavorites);
    on<RemoveFromFavorites>(_onRemoveFromFavorites);
    on<AddToFavorites>(_onAddToFavorites);
  }

  Future<int?> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    
    final idVal = prefs.get('id');
    if (idVal is int) return idVal;
    if (idVal is String) return int.tryParse(idVal);
    
    final userIdVal = prefs.get('userId');
    if (userIdVal is int) return userIdVal;
    if (userIdVal is String) return int.tryParse(userIdVal);
    
    return null;
  }

  Future<void> _onLoadFavorite(
    LoadFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    add(const GetAllFavorites());
  }

  Future<void> _onGetAllFavorites(
    GetAllFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const FavoriteState.loading());
    try {
      final userId = await _getUserId();
      if (userId == null) {
        emit(const FavoriteState.failure(message: 'User not logged in'));
        return;
      }
      final response = await favoriteUsecase.getFavorites(userId: userId);
      if (response.status) {
        emit(FavoriteState.loaded(response.favorite?.products ?? []));
      } else {
        emit(FavoriteState.failure(message: response.message ?? 'Failed to get favorites'));
      }
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
    }
  }

  Future<void> _onRemoveFromFavorites(
    RemoveFromFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    List<FavoriteProductEntity> currentFavorites = [];
    state.maybeWhen(
      loaded: (items) => currentFavorites = List.from(items),
      orElse: () {},
    );

    emit(const FavoriteState.loading());
    try {
      final userId = await _getUserId();
      if (userId == null) {
        emit(const FavoriteState.failure(message: 'User not logged in'));
        emit(FavoriteState.loaded(currentFavorites));
        return;
      }
      
      final response = await favoriteUsecase.removeFavorite(userId: userId, productId: event.id);
      if (response.status) {
        emit(const FavoriteState.success(message: 'Item removed from favorites'));
        emit(FavoriteState.loaded(response.favorite?.products ?? []));
      } else {
        emit(FavoriteState.failure(message: response.message ?? 'Failed to remove favorite'));
        emit(FavoriteState.loaded(currentFavorites));
      }
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
      emit(FavoriteState.loaded(currentFavorites));
    }
  }

  Future<void> _onAddToFavorites(
    AddToFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    List<FavoriteProductEntity> currentFavorites = [];
    state.maybeWhen(
      loaded: (items) => currentFavorites = List.from(items),
      orElse: () {},
    );

    emit(const FavoriteState.loading());
    try {
      final userId = await _getUserId();
      if (userId == null) {
        emit(const FavoriteState.failure(message: 'User not logged in'));
        emit(FavoriteState.loaded(currentFavorites));
        return;
      }

      final response = await favoriteUsecase.addFavorite(userId: userId, productId: event.productId);
      if (response.status) {
        emit(const FavoriteState.success(message: 'Item added to favorites'));
        emit(FavoriteState.loaded(response.favorite?.products ?? []));
      } else {
        emit(FavoriteState.failure(message: response.message ?? 'Failed to add to favorites'));
        emit(FavoriteState.loaded(currentFavorites));
      }
    } catch (e) {
      emit(FavoriteState.failure(message: e.toString()));
      emit(FavoriteState.loaded(currentFavorites));
    }
  }
}
