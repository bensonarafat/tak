import 'package:tak/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.token,
    required super.expiresIn,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['access_token'],
      expiresIn: json['expires_in'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': token,
      'expires_in': expiresIn,
    };
  }
}
