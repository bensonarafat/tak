import 'package:dartz/dartz.dart';
import 'package:tak/core/domain/entities/user_entity.dart';
import 'package:tak/core/domain/repositories/user_repository.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';

class FetchUserDataUseCase implements UseCase<UserEntity, void> {
  UserRepository repository;
  FetchUserDataUseCase({required this.repository});
  @override
  Future<Either<Failure, UserEntity>> call(void params) async {
    return await repository.fetchUserData();
  }
}
