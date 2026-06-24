import '../entitiy/notification_res_entitiy.dart';

abstract class NotificationRepositories {
  Future<NotificationResEntity> fetchNotifications();
}
