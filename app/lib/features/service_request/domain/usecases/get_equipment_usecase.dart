import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/service_request/domain/entities/equipment_entity.dart';
import 'package:tak/features/service_request/domain/repositories/service_request_repository.dart';

class GetEquipmentUseCase
    implements UseCase<List<EquipmentEntity>, EquipmentParams> {
  ServiceRequestRepository repository;
  GetEquipmentUseCase({required this.repository});
  @override
  Future<Either<Failure, List<EquipmentEntity>>> call(
      EquipmentParams params) async {
    return await repository.getEquipments(params);
  }
}

class EquipmentParams extends Equatable {
  final String houseId;

  const EquipmentParams({required this.houseId});
  @override
  List<Object?> get props => [houseId];
}
