import 'package:tak/features/transactions/domain/entities/invoice_entity.dart';
import 'package:tak/features/transactions/domain/entities/payment_entity.dart';

class TransactionsEntity {
  final List<InvoiceEntity> invoiceEntity;
  final List<PaymentEntity> paymentEntity;

  TransactionsEntity({
    required this.invoiceEntity,
    required this.paymentEntity,
  });
}
