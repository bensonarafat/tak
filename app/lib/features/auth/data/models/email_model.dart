import 'package:tak/features/auth/domain/entities/email_entity.dart';

class EmailModel extends EmailEntity {
  EmailModel({
    required super.message,
    required super.status,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
