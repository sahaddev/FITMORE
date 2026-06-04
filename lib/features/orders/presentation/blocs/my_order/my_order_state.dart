part of 'my_order_bloc.dart';

@freezed
abstract class MyOrderState with _$MyOrderState {
  const factory MyOrderState.initial() = _Initial;
  const factory MyOrderState.loading() = _Loading;
  const factory MyOrderState.success({required String message}) = _Success;
  const factory MyOrderState.failure({required String message}) = _Failure;
}
