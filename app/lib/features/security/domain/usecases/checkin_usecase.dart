import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/security/domain/entities/check_entity.dart';
import 'package:tak/features/security/domain/repositories/security_repositories.dart';

class CheckInUseCase implements UseCase<CheckEntity, CheckParams> {
  final SecurityRepository repository;
  CheckInUseCase({required this.repository});
  @override
  Future<Either<Failure, CheckEntity>> call(params) async {
    return await repository.checkIn(params);
  }
}

class CheckParams extends Equatable {
  final String visitorId;

  const CheckParams({required this.visitorId});

  @override
  List<Object?> get props => [visitorId];
}
