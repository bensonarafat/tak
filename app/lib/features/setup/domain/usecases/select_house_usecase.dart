import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/setup/domain/entities/account_select_entity.dart';
import 'package:tak/features/setup/domain/repositories/setup_repository.dart';

class SelectHouseUseCase
    implements UseCase<AccountSelectEntity, SelectHouseParams> {
  final SetupRepository repository;
  SelectHouseUseCase({required this.repository});

  @override
  Future<Either<Failure, AccountSelectEntity>> call(
      SelectHouseParams params) async {
    return await repository.selectHouse(params);
  }
}

class SelectHouseParams extends Equatable {
  final String houseId;
  final String status;
  final String role;

  const SelectHouseParams(
      {required this.houseId, required this.role, required this.status});

  @override
  List<Object?> get props => [houseId, status, role];
}
