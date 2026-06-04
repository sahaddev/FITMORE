import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_address_event.dart';
part 'payment_address_state.dart';
part 'payment_address_bloc.freezed.dart';

class PaymentAddressBloc extends Bloc<PaymentAddressEvent, PaymentAddressState> {
  PaymentAddressBloc() : super(const PaymentAddressState.initial()) {
    on<LoadPaymentAddress>(_onLoadPaymentAddress);
    on<SelectAddress>(_onSelectAddress);
  }

  Future<void> _onLoadPaymentAddress(
    LoadPaymentAddress event,
    Emitter<PaymentAddressState> emit,
  ) async {
    emit(const PaymentAddressState.loading());
    try {
      // TODO: Implement logic here
      emit(const PaymentAddressState.loaded(null));
    } catch (e) {
      emit(PaymentAddressState.failure(message: e.toString()));
    }
  }

  Future<void> _onSelectAddress(
    SelectAddress event,
    Emitter<PaymentAddressState> emit,
  ) async {
    emit(const PaymentAddressState.loading());
    try {
      // TODO: Implement logic here
      emit(const PaymentAddressState.success(message: 'Address selected'));
    } catch (e) {
      emit(PaymentAddressState.failure(message: e.toString()));
    }
  }
}
