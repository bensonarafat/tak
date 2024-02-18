part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {}

class TransactionInitState extends TransactionState {
  @override
  List<Object?> get props => [];
}

class PaymentTransactionLoading extends TransactionState {
  @override
  List<Object?> get props => [];
}

class PaymentTransactionLoaded extends TransactionState {
  final List<PaymentEntity> paymentEntity;

  PaymentTransactionLoaded({required this.paymentEntity});

  @override
  List<Object?> get props => [paymentEntity];
}

class PaymentTransactionError extends TransactionState {
  final String message;

  PaymentTransactionError({required this.message});
  @override
  List<Object?> get props => [message];
}

class InvoiceTransactionLoading extends TransactionState {
  @override
  List<Object?> get props => [];
}

class InvoiceTransactionLoaded extends TransactionState {
  final List<InvoiceEntity> invoiceEntity;

  InvoiceTransactionLoaded({required this.invoiceEntity});
  @override
  List<Object?> get props => [invoiceEntity];
}

class InvoiceTransactionError extends TransactionState {
  final String message;

  InvoiceTransactionError({required this.message});
  @override
  List<Object?> get props => [message];
}

class BalanceTransactionLoading extends TransactionState {
  @override
  List<Object?> get props => [];
}

class BalanceTransactionLoaded extends TransactionState {
  final BalanceEntity balanceEntity;

  BalanceTransactionLoaded({required this.balanceEntity});
  @override
  List<Object?> get props => [balanceEntity];
}

class BalanceTransactionError extends TransactionState {
  final String message;

  BalanceTransactionError({required this.message});
  @override
  List<Object?> get props => [message];
}
