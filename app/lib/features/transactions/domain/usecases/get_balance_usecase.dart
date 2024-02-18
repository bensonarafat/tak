import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/transactions/domain/entities/balance_entity.dart';
import 'package:tak/features/transactions/domain/repositories/transaction_repository.dart';

class GetBalanceUseCase implements UseCase<BalanceEntity, void> {
  final TransactionRepository repository;

  GetBalanceUseCase({required this.repository});

  @override
  Future<Either<Failure, BalanceEntity>> call(void params) async {
    return await repository.getBalance();
  }
}
