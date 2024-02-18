import 'package:tak/features/transactions/domain/entities/balance_entity.dart';

class BalanceModel extends BalanceEntity {
  BalanceModel({
    required super.rentTotal,
    required super.serviceTotal,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
        rentTotal: json['rent_total'], serviceTotal: json['service_total']);
  }
}
