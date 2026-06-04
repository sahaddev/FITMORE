import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_screen_event.dart';
part 'coupon_screen_state.dart';
part 'coupon_screen_bloc.freezed.dart';

class CouponScreenBloc extends Bloc<CouponScreenEvent, CouponScreenState> {
  CouponScreenBloc() : super(const CouponScreenState.initial()) {
    on<LoadCouponScreen>(_onLoadCouponScreen);
  }

  Future<void> _onLoadCouponScreen(
    LoadCouponScreen event,
    Emitter<CouponScreenState> emit,
  ) async {
    emit(const CouponScreenState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const CouponScreenState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(CouponScreenState.failure(message: e.toString()));
    }
  }
}
