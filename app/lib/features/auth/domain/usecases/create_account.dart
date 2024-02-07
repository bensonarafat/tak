import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/auth/domain/entities/auth_entity.dart';
import 'package:tak/features/auth/domain/repositories/auth_repository.dart';

class CreateAccountUserCase
    implements UseCase<AuthEntity, CreateAccountParams> {
  final AuthRepository repository;

  CreateAccountUserCase({required this.repository});
  @override
  Future<Either<Failure, AuthEntity>> call(CreateAccountParams params) async {
    return await repository.createAccount(params: params);
  }
}

class CreateAccountParams extends Equatable {
  final String fullname;
  final String email;
  final String password;
  const CreateAccountParams({
    required this.fullname,
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [
        fullname,
        email,
        password,
      ];
}
