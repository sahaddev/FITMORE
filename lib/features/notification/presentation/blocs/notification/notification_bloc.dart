import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState.initial()) {
    on<LoadNotification>(_onLoadNotification);
    on<GetAllNotifications>(_onGetAllNotifications);
    on<MarkAsRead>(_onMarkAsRead);
    on<MarkAllAsRead>(_onMarkAllAsRead);
  }

  Future<void> _onLoadNotification(
    LoadNotification event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());
    try {
      // TODO: Implement logic here
      await Future.delayed(const Duration(seconds: 1));
      emit(const NotificationState.success(message: 'Loaded successfully'));
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }

  Future<void> _onGetAllNotifications(
    GetAllNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());
    try {
      // TODO: Implement logic here
      emit(const NotificationState.loaded([]));
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }

  Future<void> _onMarkAsRead(
    MarkAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());
    try {
      // TODO: Implement logic here
      emit(const NotificationState.success(message: 'Notification marked as read'));
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }

  Future<void> _onMarkAllAsRead(
    MarkAllAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());
    try {
      // TODO: Implement logic here
      emit(const NotificationState.success(message: 'All notifications marked as read'));
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }
}
