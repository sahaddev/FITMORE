part of 'payment_scr_two_bloc.dart';

@freezed
abstract class PaymentScrTwoEvent with _$PaymentScrTwoEvent {
  const factory PaymentScrTwoEvent.load() = LoadPaymentScrTwo;
  const factory PaymentScrTwoEvent.selectPaymentMethod(String method) = SelectPaymentMethod;
  const factory PaymentScrTwoEvent.applyCoupon(String code) = ApplyCoupon;
  const factory PaymentScrTwoEvent.processPayment() = ProcessPayment;
}
