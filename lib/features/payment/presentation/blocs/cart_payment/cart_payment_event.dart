part of 'cart_payment_bloc.dart';

@freezed
abstract class CartPaymentEvent with _$CartPaymentEvent {
  const factory CartPaymentEvent.load() = LoadCartPayment;
}
