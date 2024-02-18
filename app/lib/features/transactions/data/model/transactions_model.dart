import 'package:tak/features/transactions/data/model/invoice_model.dart';
import 'package:tak/features/transactions/data/model/payment_model.dart';
import 'package:tak/features/transactions/domain/entities/transactions_entity.dart';

class TransactionsModel extends TransactionsEntity {
  TransactionsModel(
      {required super.invoiceEntity, required super.paymentEntity});

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonresponse2 = json['invoices'];
    List<InvoiceModel> invoices =
        jsonresponse2.map((item) => InvoiceModel.fromJson(item)).toList();
    List<dynamic> jsonresponse = json['payments'];
    List<PaymentModel> payments =
        jsonresponse.map((item) => PaymentModel.fromJson(item)).toList();
    return TransactionsModel(invoiceEntity: invoices, paymentEntity: payments);
  }
}
