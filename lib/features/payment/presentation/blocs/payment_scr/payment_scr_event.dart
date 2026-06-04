part of 'payment_scr_bloc.dart';

@freezed
abstract class PaymentScrEvent with _$PaymentScrEvent {
  const factory PaymentScrEvent.load() = LoadPaymentScr;
}
