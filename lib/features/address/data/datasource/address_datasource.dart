import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/dio_error_handler.dart';
import '../../../../core/constants/app_constants.dart';
import '../model/address_res_model.dart';

abstract class AddressDatasource {
  Future<AddressResModel> createAddress({
    required int pincode,
    required String city,
    required String state,
    required String country,
    required String buildName,
    required String streetName,
    required String phonenumber,
    required String area,
    required int userId,
  });

  Future<AddressResModel> updateAddress({
    required int id,
    required int pincode,
    required String city,
    required String state,
    required String country,
    required String buildName,
    required String streetName,
    required String phonenumber,
    required String area,
    required int userId,
  });

  Future<AddressResModel> deleteAddress(int id);

  Future<AddressResModel> getAddressByUserId(int userId);
}

class AddressDatasourceImpl implements AddressDatasource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<AddressResModel> createAddress({
    required int pincode,
    required String city,
    required String state,
    required String country,
    required String buildName,
    required String streetName,
    required String phonenumber,
    required String area,
    required int userId,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "pincode": pincode,
        "city": city,
        "state": state,
        "country": country,
        "build_name": buildName,
        "phonenumber": phonenumber,
        "street_name": streetName,
        "area": area,
        "user_id": userId,
      };

      final response = await _dioClient.post(
        AppConstants.address,
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AddressResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to create address');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AddressResModel> updateAddress({
    required int id,
    required int pincode,
    required String city,
    required String state,
    required String country,
    required String buildName,
    required String streetName,
    required String phonenumber,
    required String area,
    required int userId,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "pincode": pincode,
        "city": city,
        "state": state,
        "country": country,
        "build_name": buildName,
        "phonenumber": phonenumber,
        "street_name": streetName,
        "area": area,
        "user_id": userId,
      };
      final response = await _dioClient.put(
        '${AppConstants.address}?id=$id',
        data: data,
      );

      if (response.statusCode == 200) {
        return AddressResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to update address');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AddressResModel> deleteAddress(int id) async {
    try {
      final response = await _dioClient.delete(
        '${AppConstants.address}?id=$id',
      );

      if (response.statusCode == 200) {
        return AddressResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to delete address');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AddressResModel> getAddressByUserId(int userId) async {
    try {
      final response = await _dioClient.get(
        '${AppConstants.address}?user_id=$userId',
      );

      if (response.statusCode == 200) {
        return AddressResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch addresses');
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
