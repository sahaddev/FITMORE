import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entitiy/notification_res_entitiy.dart';
import '../../../domain/usecase/notification_usecase.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationUsecase notificationUsecase = NotificationUsecase();

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
    // Just delegating to GetAllNotifications
    add(const GetAllNotifications());
  }

  Future<void> _onGetAllNotifications(
    GetAllNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());
    try {
      final response = await notificationUsecase.fetchNotifications();
      if (response.status && response.datas != null) {
        emit(NotificationState.loaded(response.datas!));
      } else {
        emit(NotificationState.failure(
            message: response.message ?? 'Failed to load notifications'));
      }
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }

  Future<void> _onMarkAsRead(
    MarkAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    List<NotificationEntity> currentNotifications = [];
    state.maybeWhen(
      loaded: (items) => currentNotifications = List.from(items),
      orElse: () {},
    );

    emit(const NotificationState.loading());
    try {
      for (int i = 0; i < currentNotifications.length; i++) {
        var item = currentNotifications[i];
        if (item.id == event.id) {
          currentNotifications[i] = item.copyWith(isRead: true);
          break;
        }
      }

      emit(const NotificationState.success(message: 'Notification marked as read'));
      emit(NotificationState.loaded(currentNotifications));
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }

  Future<void> _onMarkAllAsRead(
    MarkAllAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    List<NotificationEntity> currentNotifications = [];
    state.maybeWhen(
      loaded: (items) => currentNotifications = List.from(items),
      orElse: () {},
    );

    emit(const NotificationState.loading());
    try {
      for (int i = 0; i < currentNotifications.length; i++) {
        currentNotifications[i] =
            currentNotifications[i].copyWith(isRead: true);
      }

      emit(const NotificationState.success(message: 'All notifications marked as read'));
      emit(NotificationState.loaded(currentNotifications));
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }
}
