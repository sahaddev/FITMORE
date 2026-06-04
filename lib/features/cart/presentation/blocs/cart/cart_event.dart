part of 'cart_bloc.dart';

@freezed
abstract class CartEvent with _$CartEvent {
  const factory CartEvent.load() = LoadCart;
  const factory CartEvent.getAllCartItems() = GetAllCartItems;
  const factory CartEvent.removeFromCart(int id) = RemoveFromCart;
  const factory CartEvent.incrementQuantity(int id) = IncrementQuantity;
  const factory CartEvent.decrementQuantity(int id) = DecrementQuantity;
  const factory CartEvent.addToCart(CartModel item) = AddToCart;
}
