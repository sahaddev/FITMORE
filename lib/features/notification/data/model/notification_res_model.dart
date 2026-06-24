import '../../domain/entitiy/notification_res_entitiy.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    super.id,
    super.userId,
    required super.title,
    required super.message,
    super.subText,
    super.timeString,
    super.isRead,
    super.createdAt,
    super.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id']?.toString(),
      userId: json['userId'],
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      subText: json['subText'],
      timeString: json['timeString'],
      isRead: json['isRead'] ?? false,
      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      userId: userId,
      title: title,
      message: message,
      subText: subText,
      timeString: timeString,
      isRead: isRead,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

class NotificationResModel extends NotificationResEntity {
  const NotificationResModel({
    required super.status,
    super.message,
    super.datas,
  });

  factory NotificationResModel.fromJson(Map<String, dynamic> json) {
    return NotificationResModel(
      status: json['status'] ?? false,
      message: json['message'],
      datas: json['datas'] != null
          ? List<NotificationEntity>.from(
              (json['datas'] as List).map((x) => NotificationModel.fromJson(x)))
          : null,
    );
  }

  NotificationResEntity toEntity() {
    return NotificationResEntity(
      status: status,
      message: message,
      datas: datas,
    );
  }
}
