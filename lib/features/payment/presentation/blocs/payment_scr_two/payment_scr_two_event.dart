part of 'payment_scr_two_bloc.dart';

@freezed
abstract class PaymentScrTwoEvent with _$PaymentScrTwoEvent {
  const factory PaymentScrTwoEvent.load() = LoadPaymentScrTwo;
}
