part of 'cart_bloc.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.success({required String message}) = _Success;
  const factory CartState.failure({required String message}) = _Failure;
  const factory CartState.loaded(CartEntity cart) = _Loaded;
}
