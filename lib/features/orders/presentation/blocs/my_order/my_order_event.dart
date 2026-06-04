part of 'my_order_bloc.dart';

@freezed
abstract class MyOrderEvent with _$MyOrderEvent {
  const factory MyOrderEvent.load() = LoadMyOrder;
}
