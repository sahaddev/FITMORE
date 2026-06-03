import 'package:dio/dio.dart';
import '../model/product_details_res_model.dart';

// Assuming DioClient, ApiEndPoint, and DioErrorHandler are available in your project.

abstract class ProductDetailsDatasource {
  Future<ProductDetailsResModel> productById({required int id});
}

class ProductDetailsDatasourceImpl implements ProductDetailsDatasource {
  final dynamic _dioClient = null; // Replace with: DioClient.instance;

  @override
  Future<ProductDetailsResModel> productById({required int id}) async {
    try {
      final response = await _dioClient.get(
        'ApiEndPoint.productById', // Replace with: ApiEndPoint.productById
        queryParameters: {
          'id': id,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProductDetailsResModel.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch product details");
      }
    } on DioException catch (e) {
      // Replace with: throw DioErrorHandler.handleDioError(e);
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
