import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_payment_event.dart';
part 'cart_payment_state.dart';
part 'cart_payment_bloc.freezed.dart';

class CartPaymentBloc extends Bloc<CartPaymentEvent, CartPaymentState> {
  CartPaymentBloc() : super(const CartPaymentState.initial()) {
    on<LoadCartPayment>(_onLoadCartPayment);
  }

  Future<void> _onLoadCartPayment(
    LoadCartPayment event,
    Emitter<CartPaymentState> emit,
  ) async {
    emit(const CartPaymentState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const CartPaymentState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(CartPaymentState.failure(message: e.toString()));
    }
  }
}
