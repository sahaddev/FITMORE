import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/product/db_product_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchData>(_onFetchData);
    on<RefreshData>(_onRefreshData);
  }

  Future<void> _onFetchData(
    FetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    try {
      // TODO: Implement home data fetching logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const HomeState.loaded([])); // Replace with actual loaded data
    } catch (e) {
      emit(HomeState.failure(message: e.toString()));
    }
  }

  Future<void> _onRefreshData(
    RefreshData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    try {
      // TODO: Implement refresh logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const HomeState.loaded([]));
    } catch (e) {
      emit(HomeState.failure(message: e.toString()));
    }
  }
}
