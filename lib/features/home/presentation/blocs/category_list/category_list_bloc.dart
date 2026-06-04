import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';
part 'category_list_bloc.freezed.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  CategoryListBloc() : super(const CategoryListState.initial()) {
    on<LoadCategoryList>(_onLoadCategoryList);
  }

  Future<void> _onLoadCategoryList(
    LoadCategoryList event,
    Emitter<CategoryListState> emit,
  ) async {
    emit(const CategoryListState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const CategoryListState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(CategoryListState.failure(message: e.toString()));
    }
  }
}
