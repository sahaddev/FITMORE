part of 'add_product_bloc.dart';

@freezed
abstract class AddProductEvent with _$AddProductEvent {
  const factory AddProductEvent.load() = LoadAddProduct;
}
