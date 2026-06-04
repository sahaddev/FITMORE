part of 'notification_bloc.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.success({required String message}) = _Success;
  const factory NotificationState.failure({required String message}) = _Failure;
}
