import 'package:dartz/dartz.dart';
import 'package:tak/core/connection/network_info.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/visitors/data/datasources/visitor_datasource.dart';
import 'package:tak/features/visitors/data/models/visitor_model.dart';
import 'package:tak/features/visitors/data/models/visitors_model.dart';
import 'package:tak/features/visitors/domain/repositories/visitor_repository.dart';

class VisitorRepositoryImpl implements VisitorRepository {
  NetworkInfo networkInfo;
  SecureStorage secureStorage;
  VisitorDataSource dataSource;

  VisitorRepositoryImpl({
    required this.networkInfo,
    required this.secureStorage,
    required this.dataSource,
  });
  @override
  Future<Either<Failure, VisitorModel>> addVisitor(params) async {
    if (await networkInfo.isConnected) {
      try {
        VisitorModel model = await dataSource.addVisitor(params);

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
  Future<Either<Failure, VisitorModel>> editVisitor(params) async {
    if (await networkInfo.isConnected) {
      try {
        VisitorModel model = await dataSource.editVisitor(params);

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
  Future<Either<Failure, List<VisitorsModel>>> getVisitors() async {
    if (await networkInfo.isConnected) {
      try {
        List<VisitorsModel> model = await dataSource.getVisitors();

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
