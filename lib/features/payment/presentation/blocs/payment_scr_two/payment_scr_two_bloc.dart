import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_scr_two_event.dart';
part 'payment_scr_two_state.dart';
part 'payment_scr_two_bloc.freezed.dart';

class PaymentScrTwoBloc extends Bloc<PaymentScrTwoEvent, PaymentScrTwoState> {
  PaymentScrTwoBloc() : super(const PaymentScrTwoState.initial()) {
    on<LoadPaymentScrTwo>(_onLoadPaymentScrTwo);
  }

  Future<void> _onLoadPaymentScrTwo(
    LoadPaymentScrTwo event,
    Emitter<PaymentScrTwoState> emit,
  ) async {
    emit(const PaymentScrTwoState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const PaymentScrTwoState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(PaymentScrTwoState.failure(message: e.toString()));
    }
  }
}
