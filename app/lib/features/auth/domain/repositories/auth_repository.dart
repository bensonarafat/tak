import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/features/auth/domain/entities/auth_entity.dart';
import 'package:tak/features/auth/domain/entities/logout_entity.dart';
import 'package:tak/features/auth/domain/entities/otp_entity.dart';
import 'package:tak/features/auth/domain/entities/email_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, OTPEntity>> verifyOTP({required params});
  Future<Either<Failure, EmailEntity>> email({required params});
  Future<Either<Failure, AuthEntity>> createAccount({required params});
  Future<Either<Failure, AuthEntity>> login({required params});
  Future<Either<Failure, LogoutEntity>> logout();
}
