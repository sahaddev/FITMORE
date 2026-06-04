import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_address_event.dart';
part 'payment_address_state.dart';
part 'payment_address_bloc.freezed.dart';

class PaymentAddressBloc extends Bloc<PaymentAddressEvent, PaymentAddressState> {
  PaymentAddressBloc() : super(const PaymentAddressState.initial()) {
    on<LoadPaymentAddress>(_onLoadPaymentAddress);
  }

  Future<void> _onLoadPaymentAddress(
    LoadPaymentAddress event,
    Emitter<PaymentAddressState> emit,
  ) async {
    emit(const PaymentAddressState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const PaymentAddressState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(PaymentAddressState.failure(message: e.toString()));
    }
  }
}
