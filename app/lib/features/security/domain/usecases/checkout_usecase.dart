import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/security/domain/entities/check_entity.dart';
import 'package:tak/features/security/domain/repositories/security_repositories.dart';
import 'package:tak/features/security/domain/usecases/checkin_usecase.dart';

class CheckOutUseCase implements UseCase<CheckEntity, CheckParams> {
  final SecurityRepository repository;
  CheckOutUseCase({required this.repository});
  @override
  Future<Either<Failure, CheckEntity>> call(params) async {
    return await repository.checkOut(params);
  }
}
