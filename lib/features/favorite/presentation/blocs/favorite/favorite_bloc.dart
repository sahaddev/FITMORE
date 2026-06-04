import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState.initial()) {
    on<LoadFavorite>(_onLoadFavorite);
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
}
