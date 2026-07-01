import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_error_handler.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/order_res_model.dart';

abstract class OrdersDatasource {
  Future<OrderResModel> createOrder({
    required int userId,
    required List<Map<String, dynamic>> products,
    required double totalAmount,
    required String shippingAddress,
    required String paymentMethod,
  });

  Future<OrderResModel> getOrderHistory(int userId);

  Future<OrderResModel> getOrderById(String orderId);
}

class OrdersDatasourceImpl implements OrdersDatasource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<OrderResModel> createOrder({
    required int userId,
    required List<Map<String, dynamic>> products,
    required double totalAmount,
    required String shippingAddress,
    required String paymentMethod,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "userId": userId,
        "products": products,
        "totalAmount": totalAmount,
        "shippingAddress": shippingAddress,
        "paymentMethod": paymentMethod,
      };

      final response = await _dioClient.post(
        '${AppConstants.order}/create',
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return OrderResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to create order');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<OrderResModel> getOrderHistory(int userId) async {
    try {
      final response = await _dioClient.get(
        '${AppConstants.order}/history/$userId',
      );

      if (response.statusCode == 200) {
        return OrderResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch order history');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<OrderResModel> getOrderById(String orderId) async {
    try {
      final response = await _dioClient.get(
        '${AppConstants.order}/$orderId',
      );

      if (response.statusCode == 200) {
        return OrderResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch order');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
