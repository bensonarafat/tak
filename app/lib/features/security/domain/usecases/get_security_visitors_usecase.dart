import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/security/domain/entities/security_visitors_entity.dart';
import 'package:tak/features/security/domain/repositories/security_repositories.dart';

class GetSecurityVisitorsUseCase
    implements UseCase<List<SecurityVisitorEntity>, void> {
  final SecurityRepository repository;
  GetSecurityVisitorsUseCase({required this.repository});
  @override
  Future<Either<Failure, List<SecurityVisitorEntity>>> call(void params) async {
    return await repository.getVisitors();
  }
}
