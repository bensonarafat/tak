import 'package:tak/features/transactions/domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  PaymentModel({
    required super.id,
    required super.tenantId,
    required super.houseId,
    required super.invoiceId,
    required super.paymentType,
    required super.charge,
    required super.amount,
    required super.balance,
    required super.paymentMethod,
    required super.preparedBy,
    required super.currency,
    required super.description,
    required super.type,
    required super.lastPaymentDate,
    required super.status,
    required super.createdAt,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      tenantId: json['tenant_id'],
      houseId: json['house_id'],
      invoiceId: json['invoice_id'],
      paymentType: json['payment_type'],
      charge: json['charge'],
      amount: json['amount'],
      balance: json['balance'],
      paymentMethod: json['payment_method'],
      preparedBy: json['preparedBy'],
      currency: json['currency'],
      description: json['description'],
      type: json['type'],
      lastPaymentDate: json['last_payment_date'],
      status: json['status'],
      createdAt: json['created_at'],
    );
  }
}
