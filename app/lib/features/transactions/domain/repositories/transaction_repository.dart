import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/features/transactions/domain/entities/balance_entity.dart';
import 'package:tak/features/transactions/domain/entities/invoice_entity.dart';
import 'package:tak/features/transactions/domain/entities/payment_entity.dart';
import 'package:tak/features/transactions/domain/entities/transactions_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<PaymentEntity>>> getPayments(params);
  Future<Either<Failure, List<InvoiceEntity>>> getInvoice(params);
  Future<Either<Failure, BalanceEntity>> getBalance();
  Future<Either<Failure, TransactionsEntity>> getTransactions();
  Future<Either<Failure, TransactionsEntity>> getRents();
  Future<Either<Failure, TransactionsEntity>> getServiceCharge();
}
