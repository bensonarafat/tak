import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/transactions/domain/entities/payment_entity.dart';
import 'package:tak/features/transactions/domain/repositories/transaction_repository.dart';

class GetPaymentsUseCase
    implements UseCase<List<PaymentEntity>, PaymentParams> {
  final TransactionRepository repository;

  GetPaymentsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PaymentEntity>>> call(params) async {
    return await repository.getPayments(params);
  }
}

class PaymentParams extends Equatable {
  final String startDate;
  final String endDate;
  final String type;

  const PaymentParams({
    required this.startDate,
    required this.endDate,
    required this.type,
  });
  @override
  List<Object?> get props => [startDate, endDate];
}
