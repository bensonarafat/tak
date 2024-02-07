import 'package:dartz/dartz.dart';
import 'package:tak/core/connection/network_info.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/service_request/data/datasources/service_request_datasource.dart';
import 'package:tak/features/service_request/data/models/equipment_model.dart';
import 'package:tak/features/service_request/data/models/service_request_model.dart';
import 'package:tak/features/service_request/data/models/service_requests_model.dart';
import 'package:tak/features/service_request/domain/repositories/service_request_repository.dart';

class ServiceRequestRepositoryImpl implements ServiceRequestRepository {
  NetworkInfo networkInfo;
  SecureStorage secureStorage;
  ServiceRequestDataSource dataSource;

  ServiceRequestRepositoryImpl({
    required this.networkInfo,
    required this.secureStorage,
    required this.dataSource,
  });
  @override
  Future<Either<Failure, ServiceRequestModel>> addService(params) async {
    if (await networkInfo.isConnected) {
      try {
        ServiceRequestModel model = await dataSource.addRequest(params);

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
  Future<Either<Failure, ServiceRequestModel>> editService(params) async {
    if (await networkInfo.isConnected) {
      try {
        ServiceRequestModel model = await dataSource.editRequest(params);

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
  Future<Either<Failure, List<EquipmentModel>>> getEquipments(params) async {
    if (await networkInfo.isConnected) {
      try {
        List<EquipmentModel> model = await dataSource.getEquipments(params);

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
  Future<Either<Failure, List<ServiceRequestsModel>>>
      getServiceRequests() async {
    if (await networkInfo.isConnected) {
      try {
        List<ServiceRequestsModel> model =
            await dataSource.getServiceRequests();

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
