import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/features/security/domain/entities/check_entity.dart';
import 'package:tak/features/security/domain/entities/security_visitors_entity.dart';

abstract class SecurityRepository {
  Future<Either<Failure, List<SecurityVisitorEntity>>> getVisitors();
  Future<Either<Failure, CheckEntity>> checkIn(params);
  Future<Either<Failure, CheckEntity>> checkOut(params);
}
