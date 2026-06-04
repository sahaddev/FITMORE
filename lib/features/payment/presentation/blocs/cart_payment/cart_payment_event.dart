part of 'cart_payment_bloc.dart';

@freezed
abstract class CartPaymentEvent with _$CartPaymentEvent {
  const factory CartPaymentEvent.load() = LoadCartPayment;
  const factory CartPaymentEvent.selectPaymentMethod(String method) = SelectPaymentMethod;
  const factory CartPaymentEvent.applyCoupon(String code) = ApplyCoupon;
  const factory CartPaymentEvent.processPayment() = ProcessPayment;
}
