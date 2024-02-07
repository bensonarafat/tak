import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/setup/domain/entities/house_entity.dart';
import 'package:tak/features/setup/domain/repositories/setup_repository.dart';

class FetchHousesUseCase extends UseCase<List<HousesEntity>, void> {
  final SetupRepository repository;

  FetchHousesUseCase({required this.repository});
  @override
  Future<Either<Failure, List<HousesEntity>>> call(void params) async {
    return await repository.getHouses();
  }
}
