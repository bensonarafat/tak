import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/auth/domain/entities/auth_entity.dart';
import 'package:tak/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<AuthEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, AuthEntity>> call(LoginParams params) {
    return repository.login(params: params);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
