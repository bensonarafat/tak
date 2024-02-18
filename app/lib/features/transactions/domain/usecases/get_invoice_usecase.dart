import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/transactions/domain/entities/invoice_entity.dart';
import 'package:tak/features/transactions/domain/repositories/transaction_repository.dart';

class GetInvoicesUseCase
    implements UseCase<List<InvoiceEntity>, InvoiceParams> {
  final TransactionRepository repository;

  GetInvoicesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<InvoiceEntity>>> call(params) async {
    return await repository.getInvoice(params);
  }
}

class InvoiceParams extends Equatable {
  final String startDate;
  final String endDate;
  final String type;

  const InvoiceParams({
    required this.startDate,
    required this.endDate,
    required this.type,
  });
  @override
  List<Object?> get props => [startDate, endDate];
}
