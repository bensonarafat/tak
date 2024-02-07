import 'package:tak/features/security/domain/entities/check_entity.dart';

class CheckModel extends CheckEntity {
  CheckModel({required super.status, required super.message});

  factory CheckModel.fromJson(Map<String, dynamic> json) {
    return CheckModel(status: json['status'], message: json['message']);
  }
}
