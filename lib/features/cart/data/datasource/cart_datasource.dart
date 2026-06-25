import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_error_handler.dart';
import '../../../../core/constants/app_constants.dart';
import '../model/cart_res_model.dart';

abstract class CartDatasource {
  Future<CartResModel> addToCart({
    required String userId,
    required String productId,
    required int quantity,
  });

  Future<CartResModel> getCart(String userId);

  Future<CartResModel> removeFromCart({
    required String userId,
    required String productId,
  });

  Future<CartResModel> clearCart(String userId);
}

class CartDatasourceImpl implements CartDatasource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<CartResModel> addToCart({
    required String userId,
    required String productId,
    required int quantity,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "userId": userId,
        "productId": productId,
        "quantity": quantity,
      };

      final response = await _dioClient.post(
        '${AppConstants.cart}/add',
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return CartResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to add to cart');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<CartResModel> getCart(String userId) async {
    try {
      final response = await _dioClient.get(
        '${AppConstants.cart}/$userId',
      );

      if (response.statusCode == 200) {
        return CartResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to get cart');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<CartResModel> removeFromCart({
    required String userId,
    required String productId,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "userId": userId,
        "productId": productId,
      };

      final response = await _dioClient.post(
        '${AppConstants.cart}/remove',
        data: data,
      );

      if (response.statusCode == 200) {
        return CartResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to remove from cart');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<CartResModel> clearCart(String userId) async {
    try {
      final Map<String, dynamic> data = {
        "userId": userId,
      };

      final response = await _dioClient.post(
        '${AppConstants.cart}/clear',
        data: data,
      );

      if (response.statusCode == 200) {
        return CartResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to clear cart');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
