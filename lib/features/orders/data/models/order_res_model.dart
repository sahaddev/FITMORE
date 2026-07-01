import '../../domain/entities/order_entity.dart';

class OrderResModel {
  final bool status;
  final String? message;
  final OrderModel? order;
  final List<OrderModel>? orders;

  OrderResModel({
    required this.status,
    this.message,
    this.order,
    this.orders,
  });

  factory OrderResModel.fromJson(Map<String, dynamic> json) {
    return OrderResModel(
      status: json['status'] ?? false,
      message: json['message'],
      order: json['order'] != null ? OrderModel.fromJson(json['order']) : null,
      orders: json['orders'] != null
          ? List<OrderModel>.from(
              json['orders'].map((x) => OrderModel.fromJson(x)))
          : null,
    );
  }
}

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.userId,
    required super.products,
    required super.totalAmount,
    required super.shippingAddress,
    required super.paymentMethod,
    required super.status,
    required super.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? 0,
      products: json['products'] != null
          ? List<OrderProductModel>.from(
              json['products'].map((x) => OrderProductModel.fromJson(x)))
          : [],
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      shippingAddress: json['shippingAddress'] ?? '',
      paymentMethod: json['paymentMethod'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      userId: userId,
      products: products,
      totalAmount: totalAmount,
      shippingAddress: shippingAddress,
      paymentMethod: paymentMethod,
      status: status,
      createdAt: createdAt,
    );
  }
}

class OrderProductModel extends OrderProductEntity {
  OrderProductModel({
    required super.productId,
    super.productName,
    super.productPrice,
    required super.quantity,
    required super.price,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    // Handle both string productId and object productId
    String pId = '';
    String? pName;
    double? pPrice;

    if (json['productId'] is Map) {
      pId = json['productId']['_id'] ?? '';
      pName = json['productId']['name'];
      pPrice = json['productId']['price'] != null
          ? (json['productId']['price'] as num).toDouble()
          : null;
    } else {
      pId = json['productId'] ?? '';
    }

    return OrderProductModel(
      productId: pId,
      productName: pName,
      productPrice: pPrice,
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}
