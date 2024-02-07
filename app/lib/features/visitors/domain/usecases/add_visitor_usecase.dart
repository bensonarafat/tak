import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/visitors/domain/entities/visitor_entity.dart';
import 'package:tak/features/visitors/domain/repositories/visitor_repository.dart';

class AddVisitorUseCase implements UseCase<VisitorEntity, VisitorParams> {
  VisitorRepository repository;

  AddVisitorUseCase({required this.repository});
  @override
  Future<Either<Failure, VisitorEntity>> call(VisitorParams params) async {
    return await repository.addVisitor(params);
  }
}

class VisitorParams extends Equatable {
  final String phone;
  final String arrival;
  final String departure;
  final String carRegno;
  final String reason;
  final String destination;
  final String visitorName;

  const VisitorParams({
    required this.phone,
    required this.arrival,
    required this.departure,
    required this.carRegno,
    required this.reason,
    required this.destination,
    required this.visitorName,
  });

  @override
  List<Object?> get props => [
        phone,
        arrival,
        departure,
        carRegno,
        reason,
        destination,
        visitorName,
      ];
}
