import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_scr_event.dart';
part 'payment_scr_state.dart';
part 'payment_scr_bloc.freezed.dart';

class PaymentScrBloc extends Bloc<PaymentScrEvent, PaymentScrState> {
  PaymentScrBloc() : super(const PaymentScrState.initial()) {
    on<LoadPaymentScr>(_onLoadPaymentScr);
  }

  Future<void> _onLoadPaymentScr(
    LoadPaymentScr event,
    Emitter<PaymentScrState> emit,
  ) async {
    emit(const PaymentScrState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const PaymentScrState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(PaymentScrState.failure(message: e.toString()));
    }
  }
}
