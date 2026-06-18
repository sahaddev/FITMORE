import 'package:dio/dio.dart';
import 'package:e_commerce/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_constants.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(SAVE_KEY_NAME);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.baseUrl = AppConstants.baseUrl;
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }
}
