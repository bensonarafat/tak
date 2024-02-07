import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/setup/domain/entities/account_select_entity.dart';
import 'package:tak/features/setup/domain/repositories/setup_repository.dart';

class AccountSelectUseCase
    implements UseCase<AccountSelectEntity, AccountSelectParams> {
  final SetupRepository repository;

  AccountSelectUseCase({required this.repository});

  @override
  Future<Either<Failure, AccountSelectEntity>> call(
      AccountSelectParams params) async {
    return await repository.selectAccount(params);
  }
}

class AccountSelectParams extends Equatable {
  final String role;
  final String status;

  const AccountSelectParams({
    required this.role,
    required this.status,
  });

  @override
  List<Object?> get props => [role, status];
}
