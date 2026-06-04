part of 'product_details_bloc.dart';

@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;
  const factory ProductDetailsState.loading() = _Loading;
  const factory ProductDetailsState.success({required String message}) = _Success;
  const factory ProductDetailsState.failure({required String message}) = _Failure;
  const factory ProductDetailsState.loaded(List<ProductModel> productList, bool isFavorite, bool isInCart) = _Loaded;
}
