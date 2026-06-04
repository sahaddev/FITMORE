part of 'payment_address_bloc.dart';

@freezed
abstract class PaymentAddressEvent with _$PaymentAddressEvent {
  const factory PaymentAddressEvent.load() = LoadPaymentAddress;
  const factory PaymentAddressEvent.selectAddress(int addressId) = SelectAddress;
}
