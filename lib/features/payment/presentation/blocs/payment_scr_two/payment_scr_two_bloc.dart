import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_scr_two_event.dart';
part 'payment_scr_two_state.dart';
part 'payment_scr_two_bloc.freezed.dart';

class PaymentScrTwoBloc extends Bloc<PaymentScrTwoEvent, PaymentScrTwoState> {
  PaymentScrTwoBloc() : super(const PaymentScrTwoState.initial()) {
    on<LoadPaymentScrTwo>(_onLoadPaymentScrTwo);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
    on<ApplyCoupon>(_onApplyCoupon);
    on<ProcessPayment>(_onProcessPayment);
  }

  Future<void> _onLoadPaymentScrTwo(
    LoadPaymentScrTwo event,
    Emitter<PaymentScrTwoState> emit,
  ) async {
    emit(const PaymentScrTwoState.loading());
    try {
      // TODO: Implement logic here
      emit(const PaymentScrTwoState.loaded('Yes'));
    } catch (e) {
      emit(PaymentScrTwoState.failure(message: e.toString()));
    }
  }

  Future<void> _onSelectPaymentMethod(
    SelectPaymentMethod event,
    Emitter<PaymentScrTwoState> emit,
  ) async {
    emit(const PaymentScrTwoState.loading());
    try {
      // TODO: Implement logic here
      emit(PaymentScrTwoState.loaded(event.method));
    } catch (e) {
      emit(PaymentScrTwoState.failure(message: e.toString()));
    }
  }

  Future<void> _onApplyCoupon(
    ApplyCoupon event,
    Emitter<PaymentScrTwoState> emit,
  ) async {
    emit(const PaymentScrTwoState.loading());
    try {
      // TODO: Implement logic here
      emit(const PaymentScrTwoState.success(message: 'Coupon applied'));
    } catch (e) {
      emit(PaymentScrTwoState.failure(message: e.toString()));
    }
  }

  Future<void> _onProcessPayment(
    ProcessPayment event,
    Emitter<PaymentScrTwoState> emit,
  ) async {
    emit(const PaymentScrTwoState.loading());
    try {
      // TODO: Implement logic here
      emit(const PaymentScrTwoState.success(message: 'Payment processed'));
    } catch (e) {
      emit(PaymentScrTwoState.failure(message: e.toString()));
    }
  }
}
