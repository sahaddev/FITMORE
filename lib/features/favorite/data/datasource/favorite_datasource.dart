import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_error_handler.dart';
import '../model/favorite_res_model.dart';

abstract class FavoriteDatasource {
  Future<FavoriteResModel> addFavorite({
    required int userId,
    required String productId,
  });

  Future<FavoriteResModel> getFavorites({
    required int userId,
  });

  Future<FavoriteResModel> removeFavorite({
    required int userId,
    required String productId,
  });
}

class FavoriteDatasourceImpl implements FavoriteDatasource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<FavoriteResModel> addFavorite({
    required int userId,
    required String productId,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "userId": userId,
        "productId": productId,
      };

      final response = await _dioClient.post(
        '/api/favorite/add',
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return FavoriteResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to add favorite');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<FavoriteResModel> getFavorites({
    required int userId,
  }) async {
    try {
      final response = await _dioClient.get(
        '/api/favorite/$userId',
      );

      if (response.statusCode == 200) {
        return FavoriteResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to get favorites');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<FavoriteResModel> removeFavorite({
    required int userId,
    required String productId,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "userId": userId,
        "productId": productId,
      };

      final response = await _dioClient.post(
        '/api/favorite/remove',
        data: data,
      );

      if (response.statusCode == 200) {
        return FavoriteResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to remove favorite');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
