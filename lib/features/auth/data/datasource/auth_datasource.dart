import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/dio_client.dart';
import '../../../../core/constants/app_constants.dart';
import '../model/auth_login_res_model.dart';
import '../model/auth_signup_res_model.dart';

// Assuming DioClient, ApiEndPoint, and DioErrorHandler are available in your project.
// You may need to add the correct imports for these based on your actual project structure.
// import '../../../core/network/dio_client.dart';
// import '../../../core/network/api_end_points.dart';
// import '../../../core/error/dio_error_handler.dart';

abstract class AuthDatasource {
  Future<AuthLoginResModel> login({
    required String email,
    required String password,
  });

  Future<AuthSignupResModel> signup({
    required String username,
    required String email,
    required String password,
    required String phonenumber,
  });
}

class AuthDatasourceImpl implements AuthDatasource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<AuthLoginResModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioClient.post(
        AppConstants.signIn,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthLoginResModel.fromJson(response.data);
      } else {
        throw Exception("Failed to login");
      }
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AuthSignupResModel> signup({
    required String username,
    required String email,
    required String password,
    required String phonenumber,
  }) async {
    try {
      final response = await _dioClient.post(
        AppConstants.signUp, // Replace with: ApiEndPoint.signup
        data: {
          "username": username,
          "email": email,
          "password": password,
          "phonenumber": phonenumber,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthSignupResModel.fromJson(response.data);
      } else {
        throw Exception("Failed to signup");
      }
    } on DioException catch (e) {
      // Replace with: throw DioErrorHandler.handleDioError(e);
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
