import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/network/dio_client.dart';
import '../model/profile_get_user_res_model.dart';
import '../model/profile_update_user_res_model.dart';

abstract class ProfileDatasource {
  Future<ProfileGetUserResModel> getUserById({required int id});

  Future<ProfileUpdateUserResModel> updateUser({
    required int id,
    required String username,
    required String email,
    required String password,
  });
}

class ProfileDatasourceImpl implements ProfileDatasource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<ProfileGetUserResModel> getUserById({required int id}) async {
    try {
      final response = await _dioClient.get(
        AppConstants.user, // Replace with: ApiEndPoint.getUserById
        queryParameters: {
          'id': id,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProfileGetUserResModel.fromJson(response.data);
      } else {
        throw Exception("Failed to fetch user");
      }
    } on DioException catch (e) {
      // Replace with: throw DioErrorHandler.handleDioError(e);
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ProfileUpdateUserResModel> updateUser({
    required int id,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioClient.put(
        AppConstants.user, // Replace with: ApiEndPoint.updateUser
        queryParameters: {
          'id': id,
        },
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProfileUpdateUserResModel.fromJson(response.data);
      } else {
        throw Exception("Failed to update user");
      }
    } on DioException catch (e) {
      // Replace with: throw DioErrorHandler.handleDioError(e);
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
