part of 'payment_last_page_bloc.dart';

@freezed
abstract class PaymentLastPageState with _$PaymentLastPageState {
  const factory PaymentLastPageState.initial() = _Initial;
  const factory PaymentLastPageState.loading() = _Loading;
  const factory PaymentLastPageState.success({required String message}) = _Success;
  const factory PaymentLastPageState.failure({required String message}) = _Failure;
}
