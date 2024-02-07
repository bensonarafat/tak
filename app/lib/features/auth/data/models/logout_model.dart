import 'package:tak/features/auth/domain/entities/logout_entity.dart';

class LogoutModel extends LogoutEntity {
  LogoutModel({required super.status, required super.message});

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
