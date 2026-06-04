part of 'payment_scr_bloc.dart';

@freezed
abstract class PaymentScrEvent with _$PaymentScrEvent {
  const factory PaymentScrEvent.load() = LoadPaymentScr;
  const factory PaymentScrEvent.updateQuantity(int quantity) = UpdateQuantity;
  const factory PaymentScrEvent.applyCoupon(String code) = ApplyCoupon;
}
