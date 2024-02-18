part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent extends Equatable {}

class InvoiceTransactionFetch extends TransactionEvent {
  final String startDate;
  final String endDate;

  InvoiceTransactionFetch({required this.startDate, required this.endDate});
  @override
  List<Object?> get props => [startDate, endDate];
}

class PaymentTransactionFetch extends TransactionEvent {
  final String startDate;
  final String endDate;

  PaymentTransactionFetch({required this.startDate, required this.endDate});
  @override
  List<Object?> get props => [startDate, endDate];
}

class BalanceTransactionFetch extends TransactionEvent {
  @override
  List<Object?> get props => [];
}
