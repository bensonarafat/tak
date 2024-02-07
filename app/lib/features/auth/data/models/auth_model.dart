import 'package:tak/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.token,
    required super.expiresIn,
    required super.status,
    required super.message,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['data']['access_token'],
      expiresIn: json['data']['expires_in'],
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
