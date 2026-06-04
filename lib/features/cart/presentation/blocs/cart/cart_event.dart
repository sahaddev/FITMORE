part of 'cart_bloc.dart';

@freezed
abstract class CartEvent with _$CartEvent {
  const factory CartEvent.load() = LoadCart;
}
