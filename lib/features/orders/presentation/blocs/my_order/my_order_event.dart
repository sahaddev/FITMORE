part of 'my_order_bloc.dart';

@freezed
abstract class MyOrderEvent with _$MyOrderEvent {
  const factory MyOrderEvent.load() = LoadMyOrder;
  const factory MyOrderEvent.getAllOrders() = GetAllOrders;
  const factory MyOrderEvent.reOrder(OrderhistoryModel order) = ReOrder;
}
