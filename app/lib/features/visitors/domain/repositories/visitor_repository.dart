import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/features/visitors/domain/entities/visitors_entity.dart';
import 'package:tak/features/visitors/domain/entities/visitor_entity.dart';

abstract class VisitorRepository {
  Future<Either<Failure, VisitorEntity>> addVisitor(params);
  Future<Either<Failure, VisitorEntity>> editVisitor(params);
  Future<Either<Failure, List<VisitorsEntity>>> getVisitors();
}
