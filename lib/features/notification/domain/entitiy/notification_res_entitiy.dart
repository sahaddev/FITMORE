import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String? id;
  final int? userId;
  final String title;
  final String message;
  final String? subText;
  final String? timeString;
  final bool isRead;
  final String? createdAt;
  final String? updatedAt;

  const NotificationEntity({
    this.id,
    this.userId,
    required this.title,
    required this.message,
    this.subText,
    this.timeString,
    this.isRead = false,
    this.createdAt,
    this.updatedAt,
  });

  NotificationEntity copyWith({
    String? id,
    int? userId,
    String? title,
    String? message,
    String? subText,
    String? timeString,
    bool? isRead,
    String? createdAt,
    String? updatedAt,
  }) {
    return NotificationEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      message: message ?? this.message,
      subText: subText ?? this.subText,
      timeString: timeString ?? this.timeString,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        message,
        subText,
        timeString,
        isRead,
        createdAt,
        updatedAt,
      ];
}

class NotificationResEntity extends Equatable {
  final bool status;
  final String? message;
  final List<NotificationEntity>? datas;

  const NotificationResEntity({
    required this.status,
    this.message,
    this.datas,
  });

  @override
  List<Object?> get props => [status, message, datas];
}
