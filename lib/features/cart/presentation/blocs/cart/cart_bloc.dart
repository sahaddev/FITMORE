import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/models/cart_/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState.initial()) {
    on<LoadCart>(_onLoadCart);
    on<GetAllCartItems>(_onGetAllCartItems);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<IncrementQuantity>(_onIncrementQuantity);
    on<DecrementQuantity>(_onDecrementQuantity);
    on<AddToCart>(_onAddToCart);
  }

  Future<void> _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const CartState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onGetAllCartItems(
    GetAllCartItems event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());
    try {
      // TODO: Implement logic here
      emit(const CartState.loaded([]));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());
    try {
      // TODO: Implement logic here
      emit(const CartState.success(message: 'Item removed from cart'));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onIncrementQuantity(
    IncrementQuantity event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());
    try {
      // TODO: Implement logic here
      emit(const CartState.success(message: 'Quantity incremented'));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onDecrementQuantity(
    DecrementQuantity event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());
    try {
      // TODO: Implement logic here
      emit(const CartState.success(message: 'Quantity decremented'));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onAddToCart(
    AddToCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());
    try {
      // TODO: Implement logic here
      emit(const CartState.success(message: 'Item added to cart'));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }
}
