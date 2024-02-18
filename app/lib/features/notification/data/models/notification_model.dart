import 'package:tak/features/notification/domain/entities/notifications_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel(
      {required super.id,
      required super.subject,
      required super.message,
      required super.createdAt});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        id: json['id'],
        subject: json['subject'],
        message: json['message'],
        createdAt: json['created_at']);
  }
}
