import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/auth/domain/entities/otp_entity.dart';
import 'package:tak/features/auth/domain/repositories/auth_repository.dart';

class VerifyOTPUserCase implements UseCase<OTPEntity, VerifyOTPParams> {
  final AuthRepository repository;

  VerifyOTPUserCase({required this.repository});

  @override
  Future<Either<Failure, OTPEntity>> call(VerifyOTPParams params) async {
    return await repository.verifyOTP(params: params);
  }
}

class VerifyOTPParams extends Equatable {
  final String otp;
  final String email;

  const VerifyOTPParams({
    required this.otp,
    required this.email,
  });

  @override
  List<Object?> get props => [
        otp,
        email,
      ];
}
