import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/service_request/domain/entities/service_requests_entity.dart';
import 'package:tak/features/service_request/domain/repositories/service_request_repository.dart';

class GetServiceRequestUseCase
    implements UseCase<List<ServiceRequestsEntity>, void> {
  ServiceRequestRepository repository;
  GetServiceRequestUseCase({required this.repository});
  @override
  Future<Either<Failure, List<ServiceRequestsEntity>>> call(void params) async {
    return await repository.getServiceRequests();
  }
}
