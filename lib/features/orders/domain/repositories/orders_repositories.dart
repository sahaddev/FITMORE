import '../entities/order_entity.dart';

abstract class OrdersRepositories {
  Future<OrderEntity> createOrder({
    required int userId,
    required List<Map<String, dynamic>> products,
    required double totalAmount,
    required String shippingAddress,
    required String paymentMethod,
  });

  Future<List<OrderEntity>> getOrderHistory(int userId);

  Future<OrderEntity> getOrderById(String orderId);
}
