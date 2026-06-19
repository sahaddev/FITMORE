import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/network/dio_client.dart';
import 'package:e_commerce/core/network/dio_error_handler.dart';
import '../model/home_res_model.dart';

// Assuming DioClient, ApiEndPoint, and DioErrorHandler are available in your project.

abstract class HomeDatasource {
  Future<HomeResModel> getAllProduct();
}

class HomeDatasourceImpl implements HomeDatasource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<HomeResModel> getAllProduct() async {
    try {
      final response = await _dioClient.get(
        AppConstants.product, // Replace with: ApiEndPoint.getAllProduct
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
