import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/transactions/domain/entities/transactions_entity.dart';
import 'package:tak/features/transactions/domain/repositories/transaction_repository.dart';

class GetRentsUseCase implements UseCase<TransactionsEntity, void> {
  final TransactionRepository repository;

  GetRentsUseCase({required this.repository});

  @override
  Future<Either<Failure, TransactionsEntity>> call(void params) async {
    return await repository.getRents();
  }
}
