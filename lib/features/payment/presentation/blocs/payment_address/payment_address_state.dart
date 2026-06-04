part of 'payment_address_bloc.dart';

@freezed
abstract class PaymentAddressState with _$PaymentAddressState {
  const factory PaymentAddressState.initial() = _Initial;
  const factory PaymentAddressState.loading() = _Loading;
  const factory PaymentAddressState.success({required String message}) = _Success;
  const factory PaymentAddressState.failure({required String message}) = _Failure;
  const factory PaymentAddressState.loaded(dynamic address) = _Loaded;
}
