part of 'coupon_screen_bloc.dart';

@freezed
abstract class CouponScreenState with _$CouponScreenState {
  const factory CouponScreenState.initial() = _Initial;
  const factory CouponScreenState.loading() = _Loading;
  const factory CouponScreenState.success({required String message}) = _Success;
  const factory CouponScreenState.failure({required String message}) = _Failure;
}
