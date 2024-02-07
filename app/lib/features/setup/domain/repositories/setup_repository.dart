import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/features/setup/domain/entities/account_select_entity.dart';
import 'package:tak/features/setup/domain/entities/house_entity.dart';

abstract class SetupRepository {
  Future<Either<Failure, AccountSelectEntity>> selectAccount(params);
  Future<Either<Failure, AccountSelectEntity>> selectHouse(params);
  Future<Either<Failure, List<HousesEntity>>> getHouses();
}
