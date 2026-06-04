part of 'product_details_bloc.dart';

@freezed
abstract class ProductDetailsEvent with _$ProductDetailsEvent {
  const factory ProductDetailsEvent.load() = LoadProductDetails;
  const factory ProductDetailsEvent.fetchProductList() = FetchProductList;
  const factory ProductDetailsEvent.toggleFavorite(ProductModel product) = ToggleFavorite;
  const factory ProductDetailsEvent.addToCart(ProductModel product) = AddToCart;
}
