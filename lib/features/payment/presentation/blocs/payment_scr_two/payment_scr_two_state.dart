part of 'payment_scr_two_bloc.dart';

@freezed
abstract class PaymentScrTwoState with _$PaymentScrTwoState {
  const factory PaymentScrTwoState.initial() = _Initial;
  const factory PaymentScrTwoState.loading() = _Loading;
  const factory PaymentScrTwoState.success({required String message}) = _Success;
  const factory PaymentScrTwoState.failure({required String message}) = _Failure;
  const factory PaymentScrTwoState.loaded(String selectedMethod) = _Loaded;
}
