part of 'notification_bloc.dart';

@freezed
abstract class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.load() = LoadNotification;
}
