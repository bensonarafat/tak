import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/auth/domain/entities/email_entity.dart';
import 'package:tak/features/auth/domain/repositories/auth_repository.dart';

class EmailUseCase implements UseCase<EmailEntity, EmailParams> {
  final AuthRepository repository;

  EmailUseCase({required this.repository});

  @override
  Future<Either<Failure, EmailEntity>> call(EmailParams params) async {
    return await repository.email(params: params);
  }
}

class EmailParams extends Equatable {
  final String email;

  const EmailParams({required this.email});

  @override
  List<Object?> get props => [email];
}
