part of 'product_edit_bloc.dart';

@freezed
abstract class ProductEditState with _$ProductEditState {
  const factory ProductEditState.initial() = _Initial;
  const factory ProductEditState.loading() = _Loading;
  const factory ProductEditState.success({required String message}) = _Success;
  const factory ProductEditState.failure({required String message}) = _Failure;
}
