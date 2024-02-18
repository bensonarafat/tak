import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/transactions/domain/entities/balance_entity.dart';
import 'package:tak/features/transactions/domain/entities/invoice_entity.dart';
import 'package:tak/features/transactions/domain/entities/payment_entity.dart';
import 'package:tak/features/transactions/domain/usecases/get_balance_usecase.dart';
import 'package:tak/features/transactions/domain/usecases/get_invoice_usecase.dart';
import 'package:tak/features/transactions/domain/usecases/get_payment_usecase.dart';

part 'transaction_event.dart';

part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetBalanceUseCase getBalanceUseCase;
  final GetInvoicesUseCase getInvoicesUseCase;
  final GetPaymentsUseCase getPaymentsUseCase;
  TransactionBloc({
    required this.getBalanceUseCase,
    required this.getInvoicesUseCase,
    required this.getPaymentsUseCase,
  }) : super(TransactionInitState()) {
    on<BalanceTransactionFetch>(
        (event, emit) => balanceTransactionFetch(event, emit));
    on<InvoiceTransactionFetch>(
        (event, emit) => invoiceTransactionFetch(event, emit));
    on<PaymentTransactionFetch>(
        (event, emit) => paymentTransactionFetch(event, emit));
  }

  balanceTransactionFetch(event, emit) async {
    emit(BalanceTransactionLoading());

    final failureOrGet = await getBalanceUseCase({});

    emit(failureOrGet.fold(
        (failure) =>
            BalanceTransactionError(message: mapFailureToMessage(failure)),
        (balanceEntity) =>
            BalanceTransactionLoaded(balanceEntity: balanceEntity)));
  }

  invoiceTransactionFetch(event, emit) async {
    emit(InvoiceTransactionLoading());

    final failureOrGet = await getInvoicesUseCase(InvoiceParams(
      startDate: event.startDate,
      endDate: event.endDate,
      type: event.type,
    ));

    emit(failureOrGet.fold(
        (failure) =>
            InvoiceTransactionError(message: mapFailureToMessage(failure)),
        (invoiceEntity) =>
            InvoiceTransactionLoaded(invoiceEntity: invoiceEntity)));
  }

  paymentTransactionFetch(event, emit) async {
    emit(PaymentTransactionLoading());

    final failureOrGet = await getPaymentsUseCase(PaymentParams(
      startDate: event.startDate,
      endDate: event.endDate,
      type: event.type,
    ));

    emit(failureOrGet.fold(
        (failure) =>
            PaymentTransactionError(message: mapFailureToMessage(failure)),
        (paymentEntity) =>
            PaymentTransactionLoaded(paymentEntity: paymentEntity)));
  }
}
