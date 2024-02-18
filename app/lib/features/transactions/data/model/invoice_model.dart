import 'package:tak/features/transactions/domain/entities/invoice_entity.dart';

class InvoiceModel extends InvoiceEntity {
  InvoiceModel({
    required super.id,
    required super.invoiceNo,
    required super.tenantId,
    required super.endDate,
    required super.rentId,
    required super.status,
    required super.amount,
    required super.type,
    required super.houseId,
    required super.createdAt,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      id: json['id'],
      invoiceNo: json['invoice_no'],
      tenantId: json['tenant_id'],
      endDate: json['end_date'],
      rentId: json['rent_id'],
      status: json['status'],
      amount: json['amount'],
      type: json['type'],
      houseId: json['house_id'],
      createdAt: json['created_at'],
    );
  }
}
