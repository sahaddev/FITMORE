part of 'order_details_bloc.dart';

@freezed
abstract class OrderDetailsEvent with _$OrderDetailsEvent {
  const factory OrderDetailsEvent.load() = LoadOrderDetails;
}
