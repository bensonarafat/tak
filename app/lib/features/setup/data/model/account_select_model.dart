import 'package:tak/features/setup/domain/entities/account_select_entity.dart';

class AccountSelectModel extends AccountSelectEntity {
  AccountSelectModel({required super.status, required super.message});

  factory AccountSelectModel.fromJson(Map<String, dynamic> json) {
    return AccountSelectModel(status: json['status'], message: json['message']);
  }
}
