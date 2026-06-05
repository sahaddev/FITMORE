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
      emit(const NotificationState.loaded([]));
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }

  Future<void> _onGetAllNotifications(
    GetAllNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    List<dynamic> currentNotifications = [];
    state.maybeWhen(
      loaded: (items) => currentNotifications = items,
      orElse: () {},
    );

    emit(const NotificationState.loading());
    try {
      emit(NotificationState.loaded(currentNotifications));
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }

  Future<void> _onMarkAsRead(
    MarkAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    List<dynamic> currentNotifications = [];
    state.maybeWhen(
      loaded: (items) => currentNotifications = List.from(items),
      orElse: () {},
    );

    emit(const NotificationState.loading());
    try {
      for (int i = 0; i < currentNotifications.length; i++) {
        var item = currentNotifications[i];
        if (item is Map<String, dynamic> && item['id'] == event.id) {
          // If the item is a map, we can update the read status
          final updatedItem = Map<String, dynamic>.from(item);
          updatedItem['isRead'] = true;
          currentNotifications[i] = updatedItem;
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
    List<dynamic> currentNotifications = [];
    state.maybeWhen(
      loaded: (items) => currentNotifications = List.from(items),
      orElse: () {},
    );

    emit(const NotificationState.loading());
    try {
      for (int i = 0; i < currentNotifications.length; i++) {
        var item = currentNotifications[i];
        if (item is Map<String, dynamic>) {
          final updatedItem = Map<String, dynamic>.from(item);
          updatedItem['isRead'] = true;
          currentNotifications[i] = updatedItem;
        }
      }

      emit(const NotificationState.success(message: 'All notifications marked as read'));
      emit(NotificationState.loaded(currentNotifications));
    } catch (e) {
      emit(NotificationState.failure(message: e.toString()));
    }
  }
}
