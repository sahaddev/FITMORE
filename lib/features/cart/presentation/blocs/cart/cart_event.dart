part of 'cart_bloc.dart';

@freezed
abstract class CartEvent with _$CartEvent {
  const factory CartEvent.load() = LoadCart;
  const factory CartEvent.removeFromCart(String productId) = RemoveFromCart;
  const factory CartEvent.incrementQuantity(String productId) = IncrementQuantity;
  const factory CartEvent.decrementQuantity(String productId) = DecrementQuantity;
  const factory CartEvent.addToCart(String productId, {int? quantity}) = AddToCart;
  const factory CartEvent.clearCart() = ClearCart;
}
