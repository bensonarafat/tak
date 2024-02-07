import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/service_request/domain/entities/service_request_entity.dart';
import 'package:tak/features/service_request/domain/repositories/service_request_repository.dart';

class EditRequestUseCase
    implements UseCase<ServiceRequestEntity, EditServiceRequestParams> {
  ServiceRequestRepository repository;
  EditRequestUseCase({required this.repository});
  @override
  Future<Either<Failure, ServiceRequestEntity>> call(
      EditServiceRequestParams params) async {
    return await repository.editService(params);
  }
}

class EditServiceRequestParams extends Equatable {
  final String name;
  final String priority;
  final String description;
  final String id;
  final String section;
  final List<String> location;
  final List<String> maintenance;

  const EditServiceRequestParams({
    required this.name,
    required this.priority,
    required this.description,
    required this.id,
    required this.location,
    required this.section,
    required this.maintenance,
  });
  @override
  List<Object?> get props =>
      [name, priority, description, section, location, maintenance];
}
