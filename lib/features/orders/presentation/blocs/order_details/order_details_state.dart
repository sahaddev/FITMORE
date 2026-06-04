part of 'order_details_bloc.dart';

@freezed
abstract class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = _Initial;
  const factory OrderDetailsState.loading() = _Loading;
  const factory OrderDetailsState.success({required String message}) = _Success;
  const factory OrderDetailsState.failure({required String message}) = _Failure;
}
