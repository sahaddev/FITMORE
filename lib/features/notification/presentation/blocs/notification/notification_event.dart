part of 'notification_bloc.dart';

@freezed
abstract class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.load() = LoadNotification;
  const factory NotificationEvent.getAllNotifications() = GetAllNotifications;
  const factory NotificationEvent.markAsRead(String id) = MarkAsRead;
  const factory NotificationEvent.markAllAsRead() = MarkAllAsRead;
}
