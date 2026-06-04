part of 'cart_payment_bloc.dart';

@freezed
abstract class CartPaymentState with _$CartPaymentState {
  const factory CartPaymentState.initial() = _Initial;
  const factory CartPaymentState.loading() = _Loading;
  const factory CartPaymentState.success({required String message}) = _Success;
  const factory CartPaymentState.failure({required String message}) = _Failure;
  const factory CartPaymentState.loaded(String selectedMethod) = _Loaded;
}
