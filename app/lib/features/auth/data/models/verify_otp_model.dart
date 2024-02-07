import 'package:tak/features/auth/domain/entities/otp_entity.dart';

class VerifyOTPModel extends OTPEntity {
  VerifyOTPModel({
    required super.message,
    required super.status,
  });

  factory VerifyOTPModel.fromJson(Map<String, dynamic> json) {
    return VerifyOTPModel(
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
