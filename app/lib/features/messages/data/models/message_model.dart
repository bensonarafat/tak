import 'package:tak/features/messages/domain/entities/messages_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel(
      {required super.id,
      required super.title,
      required super.message,
      required super.createdAt});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        id: json['id'],
        title: json['title'],
        message: json['message'],
        createdAt: json['created_at']);
  }
}
