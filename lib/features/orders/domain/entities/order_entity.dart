class OrderEntity {
  final String id;
  final int userId;
  final List<OrderProductEntity> products;
  final double totalAmount;
  final String shippingAddress;
  final String paymentMethod;
  final String status;
  final DateTime createdAt;

  OrderEntity({
    required this.id,
    required this.userId,
    required this.products,
    required this.totalAmount,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.status,
    required this.createdAt,
  });
}

class OrderProductEntity {
  final String productId;
  final String? productName;
  final double? productPrice;
  final int quantity;
  final double price;

  OrderProductEntity({
    required this.productId,
    this.productName,
    this.productPrice,
    required this.quantity,
    required this.price,
  });
}
