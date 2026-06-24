import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../model/notification_res_model.dart';

abstract class NotificationDatasource {
  Future<NotificationResModel> fetchNotifications();
}

class NotificationDatasourceImpl implements NotificationDatasource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<NotificationResModel> fetchNotifications() async {
    try {
      final response = await _dioClient.get('/api/notifications');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NotificationResModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch notifications');
      }
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Unknown DioException occurred');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
