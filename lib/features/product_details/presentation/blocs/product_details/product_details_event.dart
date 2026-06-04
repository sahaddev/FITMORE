part of 'product_details_bloc.dart';

@freezed
abstract class ProductDetailsEvent with _$ProductDetailsEvent {
  const factory ProductDetailsEvent.load() = LoadProductDetails;
}
