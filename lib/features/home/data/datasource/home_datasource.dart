import 'package:dio/dio.dart';
import '../model/home_res_model.dart';

// Assuming DioClient, ApiEndPoint, and DioErrorHandler are available in your project.

abstract class HomeDatasource {
  Future<HomeResModel> getAllProduct();
}

class HomeDatasourceImpl implements HomeDatasource {
  final dynamic _dioClient = null; // Replace with: DioClient.instance;

  @override
  Future<HomeResModel> getAllProduct() async {
    try {
      final response = await _dioClient.get(
        'ApiEndPoint.getAllProduct', // Replace with: ApiEndPoint.getAllProduct
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HomeResModel.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch products");
      }
    } on DioException catch (e) {
      // Replace with: throw DioErrorHandler.handleDioError(e);
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
