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
      // Just initialize with an empty cart
      emit(const CartState.loaded([]));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onGetAllCartItems(
    GetAllCartItems event,
    Emitter<CartState> emit,
  ) async {
    List<CartModel> currentItems = [];
    state.maybeWhen(
      loaded: (items) => currentItems = items,
      orElse: () {},
    );
    
    emit(const CartState.loading());
    try {
      emit(CartState.loaded(currentItems));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    List<CartModel> currentItems = [];
    state.maybeWhen(
      loaded: (items) => currentItems = List.from(items),
      orElse: () {},
    );

    emit(const CartState.loading());
    try {
      currentItems.removeWhere((item) => item.id == event.id);
      emit(const CartState.success(message: 'Item removed from cart'));
      emit(CartState.loaded(currentItems));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onIncrementQuantity(
    IncrementQuantity event,
    Emitter<CartState> emit,
  ) async {
    List<CartModel> currentItems = [];
    state.maybeWhen(
      loaded: (items) => currentItems = List.from(items),
      orElse: () {},
    );

    emit(const CartState.loading());
    try {
      final index = currentItems.indexWhere((item) => item.id == event.id);
      if (index != -1) {
        currentItems[index].quantity += 1;
        currentItems[index].newPrice = currentItems[index].quantity * currentItems[index].price;
      }
      emit(CartState.loaded(currentItems));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onDecrementQuantity(
    DecrementQuantity event,
    Emitter<CartState> emit,
  ) async {
    List<CartModel> currentItems = [];
    state.maybeWhen(
      loaded: (items) => currentItems = List.from(items),
      orElse: () {},
    );

    emit(const CartState.loading());
    try {
      final index = currentItems.indexWhere((item) => item.id == event.id);
      if (index != -1 && currentItems[index].quantity > 1) {
        currentItems[index].quantity -= 1;
        currentItems[index].newPrice = currentItems[index].quantity * currentItems[index].price;
      }
      emit(CartState.loaded(currentItems));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onAddToCart(
    AddToCart event,
    Emitter<CartState> emit,
  ) async {
    List<CartModel> currentItems = [];
    state.maybeWhen(
      loaded: (items) => currentItems = List.from(items),
      orElse: () {},
    );

    emit(const CartState.loading());
    try {
      final existingItemIndex = currentItems.indexWhere((item) => item.id == event.item.id);
      if (existingItemIndex != -1) {
        currentItems[existingItemIndex].quantity += event.item.quantity;
        currentItems[existingItemIndex].newPrice = currentItems[existingItemIndex].quantity * currentItems[existingItemIndex].price;
      } else {
        currentItems.add(event.item);
      }
      emit(const CartState.success(message: 'Item added to cart'));
      emit(CartState.loaded(currentItems));
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }
}
