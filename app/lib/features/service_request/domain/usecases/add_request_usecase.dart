import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/service_request/domain/entities/service_request_entity.dart';
import 'package:tak/features/service_request/domain/repositories/service_request_repository.dart';

class AddRequestUseCase
    implements UseCase<ServiceRequestEntity, ServiceRequestParams> {
  ServiceRequestRepository repository;
  AddRequestUseCase({required this.repository});
  @override
  Future<Either<Failure, ServiceRequestEntity>> call(
      ServiceRequestParams params) async {
    return await repository.addService(params);
  }
}

class ServiceRequestParams extends Equatable {
  final String name;
  final String priority;
  final String description;
  final String houseId;
  final String section;
  final List<String> maintenance;
  final List<String> location;

  const ServiceRequestParams(
      {required this.name,
      required this.priority,
      required this.description,
      required this.houseId,
      required this.section,
      required this.maintenance,
      required this.location});
  @override
  List<Object?> get props => [
        name,
        priority,
        description,
        houseId,
        section,
        maintenance,
        location,
      ];
}
