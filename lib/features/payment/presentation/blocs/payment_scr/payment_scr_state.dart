part of 'payment_scr_bloc.dart';

@freezed
abstract class PaymentScrState with _$PaymentScrState {
  const factory PaymentScrState.initial() = _Initial;
  const factory PaymentScrState.loading() = _Loading;
  const factory PaymentScrState.success({required String message}) = _Success;
  const factory PaymentScrState.failure({required String message}) = _Failure;
  const factory PaymentScrState.loaded(dynamic product, int quantity, num totalPrice) = _Loaded;
}
