import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/visitors/domain/entities/visitors_entity.dart';
import 'package:tak/features/visitors/domain/repositories/visitor_repository.dart';

class GetVisitorsUseCase implements UseCase<List<VisitorsEntity>, void> {
  VisitorRepository repository;
  GetVisitorsUseCase({required this.repository});
  @override
  Future<Either<Failure, List<VisitorsEntity>>> call(void params) async {
    return await repository.getVisitors();
  }
}
