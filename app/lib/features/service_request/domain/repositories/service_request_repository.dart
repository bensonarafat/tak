import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/features/service_request/domain/entities/equipment_entity.dart';
import 'package:tak/features/service_request/domain/entities/service_request_entity.dart';
import 'package:tak/features/service_request/domain/entities/service_requests_entity.dart';

abstract class ServiceRequestRepository {
  Future<Either<Failure, ServiceRequestEntity>> addService(params);
  Future<Either<Failure, ServiceRequestEntity>> editService(params);
  Future<Either<Failure, List<EquipmentEntity>>> getEquipments(params);
  Future<Either<Failure, List<ServiceRequestsEntity>>> getServiceRequests();
}
