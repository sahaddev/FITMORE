part of 'coupon_screen_bloc.dart';

@freezed
abstract class CouponScreenEvent with _$CouponScreenEvent {
  const factory CouponScreenEvent.load() = LoadCouponScreen;
}
