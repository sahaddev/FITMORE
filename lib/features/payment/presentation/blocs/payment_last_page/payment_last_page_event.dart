part of 'payment_last_page_bloc.dart';

@freezed
abstract class PaymentLastPageEvent with _$PaymentLastPageEvent {
  const factory PaymentLastPageEvent.load() = LoadPaymentLastPage;
}
