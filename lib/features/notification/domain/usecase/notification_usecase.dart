import '../entitiy/notification_res_entitiy.dart';
import '../repositories/notification_repositories.dart';
import '../../data/repositories_impl/notification_repo_impl.dart';

class NotificationUsecase {
  final NotificationRepositories notificationRepositories =
      NotificationRepoImpl();

  Future<NotificationResEntity> fetchNotifications() async {
    return await notificationRepositories.fetchNotifications();
  }
}
