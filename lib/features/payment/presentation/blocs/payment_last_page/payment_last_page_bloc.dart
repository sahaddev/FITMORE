import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_last_page_event.dart';
part 'payment_last_page_state.dart';
part 'payment_last_page_bloc.freezed.dart';

class PaymentLastPageBloc extends Bloc<PaymentLastPageEvent, PaymentLastPageState> {
  PaymentLastPageBloc() : super(const PaymentLastPageState.initial()) {
    on<LoadPaymentLastPage>(_onLoadPaymentLastPage);
  }

  Future<void> _onLoadPaymentLastPage(
    LoadPaymentLastPage event,
    Emitter<PaymentLastPageState> emit,
  ) async {
    emit(const PaymentLastPageState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const PaymentLastPageState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(PaymentLastPageState.failure(message: e.toString()));
    }
  }
}
