import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/network/dio_client.dart';
import 'package:e_commerce/core/network/dio_error_handler.dart';
import '../model/home_res_model.dart';

// Assuming DioClient, ApiEndPoint, and DioErrorHandler are available in your project.

abstract class HomeDatasource {
  Future<HomeResModel> getAllProduct({String? search, String? category});
}

class HomeDatasourceImpl implements HomeDatasource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<HomeResModel> getAllProduct({String? search, String? category}) async {
    try {
      final queryParams = <String, dynamic>{};
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }
      if (category != null && category.isNotEmpty) {
        queryParams['category'] = category;
      }

      final response = await _dioClient.get(
        AppConstants.product, // Replace with: ApiEndPoint.getAllProduct
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HomeResModel.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch products");
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
