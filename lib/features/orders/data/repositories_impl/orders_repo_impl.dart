import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/orders_repositories.dart';
import '../datasource/orders_datasource.dart';

class OrdersRepoImpl implements OrdersRepositories {
  OrdersDatasource ordersDatasource = OrdersDatasourceImpl();

  @override
  Future<OrderEntity> createOrder({
    required int userId,
    required List<Map<String, dynamic>> products,
    required double totalAmount,
    required String shippingAddress,
    required String paymentMethod,
  }) {
    return ordersDatasource
        .createOrder(
          userId: userId,
          products: products,
          totalAmount: totalAmount,
          shippingAddress: shippingAddress,
          paymentMethod: paymentMethod,
        )
        .then((value) {
          if (value.order != null) {
            return value.order!.toEntity();
          } else {
            throw Exception('Order data is missing');
          }
        });
  }

  @override
  Future<List<OrderEntity>> getOrderHistory(int userId) {
    return ordersDatasource
        .getOrderHistory(userId)
        .then((value) {
          if (value.orders != null) {
            return value.orders!.map((e) => e.toEntity()).toList();
          } else {
            throw Exception('Orders data is missing');
          }
        });
  }

  @override
  Future<OrderEntity> getOrderById(String orderId) {
    return ordersDatasource
        .getOrderById(orderId)
        .then((value) {
          if (value.order != null) {
            return value.order!.toEntity();
          } else {
            throw Exception('Order data is missing');
          }
        });
  }
}
