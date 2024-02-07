import 'package:dartz/dartz.dart';
import 'package:tak/core/connection/network_info.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/security/data/datasources/security_datasource.dart';
import 'package:tak/features/security/data/models/check_model.dart';
import 'package:tak/features/security/domain/entities/security_visitors_entity.dart';
import 'package:tak/features/security/domain/repositories/security_repositories.dart';

class SecurityRepositoryImpl implements SecurityRepository {
  NetworkInfo networkInfo;
  SecureStorage secureStorage;
  SecurityDataSource dataSource;

  SecurityRepositoryImpl({
    required this.networkInfo,
    required this.secureStorage,
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<SecurityVisitorEntity>>> getVisitors() async {
    if (await networkInfo.isConnected) {
      try {
        List<SecurityVisitorEntity> model = await dataSource.getVisitors();

        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, CheckModel>> checkIn(params) async {
    if (await networkInfo.isConnected) {
      try {
        CheckModel model = await dataSource.checkIn(params);

        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, CheckModel>> checkOut(params) async {
    if (await networkInfo.isConnected) {
      try {
        CheckModel model = await dataSource.checkOut(params);

        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }
}
