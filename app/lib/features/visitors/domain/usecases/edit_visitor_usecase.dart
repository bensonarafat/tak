import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/visitors/domain/entities/visitor_entity.dart';
import 'package:tak/features/visitors/domain/repositories/visitor_repository.dart';

class EditVisitorUseCase implements UseCase<VisitorEntity, EditVisitorParams> {
  VisitorRepository repository;

  EditVisitorUseCase({required this.repository});
  @override
  Future<Either<Failure, VisitorEntity>> call(EditVisitorParams params) async {
    return await repository.addVisitor(params);
  }
}

class EditVisitorParams extends Equatable {
  final String phone;
  final String arrival;
  final String departure;
  final String carRegno;
  final String reason;
  final String destination;
  final String visitorName;
  final String id;

  const EditVisitorParams({
    required this.phone,
    required this.arrival,
    required this.departure,
    required this.carRegno,
    required this.reason,
    required this.destination,
    required this.visitorName,
    required this.id,
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
        id,
      ];
}
