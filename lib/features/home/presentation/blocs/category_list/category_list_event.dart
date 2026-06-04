part of 'category_list_bloc.dart';

@freezed
abstract class CategoryListEvent with _$CategoryListEvent {
  const factory CategoryListEvent.load() = LoadCategoryList;
}
