import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_scr_event.dart';
part 'payment_scr_state.dart';
part 'payment_scr_bloc.freezed.dart';

class PaymentScrBloc extends Bloc<PaymentScrEvent, PaymentScrState> {
  PaymentScrBloc() : super(const PaymentScrState.initial()) {
    on<LoadPaymentScr>(_onLoadPaymentScr);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ApplyCoupon>(_onApplyCoupon);
  }

  Future<void> _onLoadPaymentScr(
    LoadPaymentScr event,
    Emitter<PaymentScrState> emit,
  ) async {
    emit(const PaymentScrState.loading());
    try {
      // TODO: Implement logic here
      emit(const PaymentScrState.loaded(null, 1, 0.0));
    } catch (e) {
      emit(PaymentScrState.failure(message: e.toString()));
    }
  }

  Future<void> _onUpdateQuantity(
    UpdateQuantity event,
    Emitter<PaymentScrState> emit,
  ) async {
    emit(const PaymentScrState.loading());
    try {
      // TODO: Implement logic here
      emit(PaymentScrState.loaded(null, event.quantity, 0.0));
    } catch (e) {
      emit(PaymentScrState.failure(message: e.toString()));
    }
  }

  Future<void> _onApplyCoupon(
    ApplyCoupon event,
    Emitter<PaymentScrState> emit,
  ) async {
    emit(const PaymentScrState.loading());
    try {
      // TODO: Implement logic here
      emit(const PaymentScrState.success(message: 'Coupon applied'));
    } catch (e) {
      emit(PaymentScrState.failure(message: e.toString()));
    }
  }
}
