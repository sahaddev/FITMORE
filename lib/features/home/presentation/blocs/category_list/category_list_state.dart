part of 'category_list_bloc.dart';

@freezed
abstract class CategoryListState with _$CategoryListState {
  const factory CategoryListState.initial() = _Initial;
  const factory CategoryListState.loading() = _Loading;
  const factory CategoryListState.success({required String message}) = _Success;
  const factory CategoryListState.failure({required String message}) = _Failure;
}
