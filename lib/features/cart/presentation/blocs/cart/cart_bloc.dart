import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entitiy/cart_res_entitiy.dart';
import '../../../domain/usecase/cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartUseCase getCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final ClearCartUseCase clearCartUseCase;

  CartBloc({
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.removeFromCartUseCase,
    required this.clearCartUseCase,
  }) : super(const CartState.initial()) {
    on<LoadCart>(_onLoadCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<IncrementQuantity>(_onIncrementQuantity);
    on<DecrementQuantity>(_onDecrementQuantity);
    on<AddToCart>(_onAddToCart);
    on<ClearCart>(_onClearCart);
  }

  Future<String?> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Auth logic saves the user id as an integer
    final numId = prefs.getInt('id');
    if (numId != null) return numId.toString();

    // Fallback if 'profile' exists (as stringified JSON, though usually an image path)
    final profileData = prefs.getString('profile');
    if (profileData != null && profileData.startsWith('{')) {
      final userMap = json.decode(profileData);
      return userMap['_id']?.toString() ?? userMap['id']?.toString();
    }
    
    return null;
  }

  Future<void> _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());
    try {
      final userId = await _getUserId();
      if (userId == null) {
        emit(const CartState.failure(message: 'User not logged in'));
        return;
      }

      final response = await getCartUseCase(userId);
      if (response.status && response.cart != null) {
        emit(CartState.loaded(response.cart!));
      } else {
        emit(CartState.failure(message: response.message ?? 'Failed to load cart'));
      }
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
      final userId = await _getUserId();
      if (userId == null) {
        emit(const CartState.failure(message: 'User not logged in'));
        return;
      }

      final response = await removeFromCartUseCase(
        userId: userId,
        productId: event.productId,
      );

      if (response.status && response.cart != null) {
        emit(CartState.success(message: 'Item removed from cart'));
        emit(CartState.loaded(response.cart!));
      } else {
        emit(CartState.failure(message: response.message ?? 'Failed to remove from cart'));
      }
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onIncrementQuantity(
    IncrementQuantity event,
    Emitter<CartState> emit,
  ) async {
    // Treat increment as adding 1 quantity
    emit(const CartState.loading());
    try {
      final userId = await _getUserId();
      if (userId == null) {
        emit(const CartState.failure(message: 'User not logged in'));
        return;
      }

      final response = await addToCartUseCase(
        userId: userId,
        productId: event.productId,
        quantity: 1,
      );

      if (response.status && response.cart != null) {
        emit(CartState.loaded(response.cart!));
      } else {
        emit(CartState.failure(message: response.message ?? 'Failed to update quantity'));
      }
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onDecrementQuantity(
    DecrementQuantity event,
    Emitter<CartState> emit,
  ) async {
    // Treat decrement as adding -1 quantity
    emit(const CartState.loading());
    try {
      final userId = await _getUserId();
      if (userId == null) {
        emit(const CartState.failure(message: 'User not logged in'));
        return;
      }

      final response = await addToCartUseCase(
        userId: userId,
        productId: event.productId,
        quantity: -1,
      );

      if (response.status && response.cart != null) {
        emit(CartState.loaded(response.cart!));
      } else {
        emit(CartState.failure(message: response.message ?? 'Failed to update quantity'));
      }
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
      final userId = await _getUserId();
      if (userId == null) {
        emit(const CartState.failure(message: 'User not logged in'));
        return;
      }

      final response = await addToCartUseCase(
        userId: userId,
        productId: event.productId,
        quantity: event.quantity ?? 1,
      );

      if (response.status && response.cart != null) {
        emit(const CartState.success(message: 'Item added to cart'));
        emit(CartState.loaded(response.cart!));
      } else {
        emit(CartState.failure(message: response.message ?? 'Failed to add item to cart'));
      }
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }

  Future<void> _onClearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());
    try {
      final userId = await _getUserId();
      if (userId == null) {
        emit(const CartState.failure(message: 'User not logged in'));
        return;
      }

      final response = await clearCartUseCase(userId);

      if (response.status && response.cart != null) {
        emit(const CartState.success(message: 'Cart cleared'));
        emit(CartState.loaded(response.cart!));
      } else {
        emit(CartState.failure(message: response.message ?? 'Failed to clear cart'));
      }
    } catch (e) {
      emit(CartState.failure(message: e.toString()));
    }
  }
}
