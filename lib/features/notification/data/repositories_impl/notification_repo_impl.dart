import '../../domain/entitiy/notification_res_entitiy.dart';
import '../../domain/repositories/notification_repositories.dart';
import '../datasource/notification_datasource.dart';

class NotificationRepoImpl implements NotificationRepositories {
  final NotificationDatasource notificationDatasource =
      NotificationDatasourceImpl();

  @override
  Future<NotificationResEntity> fetchNotifications() async {
    final response = await notificationDatasource.fetchNotifications();
    return response.toEntity();
  }
}
