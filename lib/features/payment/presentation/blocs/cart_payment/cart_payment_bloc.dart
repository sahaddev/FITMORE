import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_payment_event.dart';
part 'cart_payment_state.dart';
part 'cart_payment_bloc.freezed.dart';

class CartPaymentBloc extends Bloc<CartPaymentEvent, CartPaymentState> {
  CartPaymentBloc() : super(const CartPaymentState.initial()) {
    on<LoadCartPayment>(_onLoadCartPayment);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
    on<ApplyCoupon>(_onApplyCoupon);
    on<ProcessPayment>(_onProcessPayment);
  }

  Future<void> _onLoadCartPayment(
    LoadCartPayment event,
    Emitter<CartPaymentState> emit,
  ) async {
    emit(const CartPaymentState.loading());
    try {
      // TODO: Implement logic here
      emit(const CartPaymentState.loaded('Yes'));
    } catch (e) {
      emit(CartPaymentState.failure(message: e.toString()));
    }
  }

  Future<void> _onSelectPaymentMethod(
    SelectPaymentMethod event,
    Emitter<CartPaymentState> emit,
  ) async {
    emit(const CartPaymentState.loading());
    try {
      // TODO: Implement logic here
      emit(CartPaymentState.loaded(event.method));
    } catch (e) {
      emit(CartPaymentState.failure(message: e.toString()));
    }
  }

  Future<void> _onApplyCoupon(
    ApplyCoupon event,
    Emitter<CartPaymentState> emit,
  ) async {
    emit(const CartPaymentState.loading());
    try {
      // TODO: Implement logic here
      emit(const CartPaymentState.success(message: 'Coupon applied'));
    } catch (e) {
      emit(CartPaymentState.failure(message: e.toString()));
    }
  }

  Future<void> _onProcessPayment(
    ProcessPayment event,
    Emitter<CartPaymentState> emit,
  ) async {
    emit(const CartPaymentState.loading());
    try {
      // TODO: Implement logic here
      emit(const CartPaymentState.success(message: 'Payment processed'));
    } catch (e) {
      emit(CartPaymentState.failure(message: e.toString()));
    }
  }
}
