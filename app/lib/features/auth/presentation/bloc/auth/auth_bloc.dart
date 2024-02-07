import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/auth/domain/entities/auth_entity.dart';
import 'package:tak/features/auth/domain/entities/otp_entity.dart';
import 'package:tak/features/auth/domain/entities/email_entity.dart';
import 'package:tak/features/auth/domain/usecases/auth.dart';
import 'package:tak/features/auth/domain/usecases/create_account.dart';
import 'package:tak/features/auth/domain/usecases/email.dart';
import 'package:tak/features/auth/domain/usecases/logout.dart';
import 'package:tak/features/auth/domain/usecases/verify_otp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final storage = const FlutterSecureStorage();

  final CreateAccountUserCase createAccountUserCase;
  final EmailUseCase emailUseCase;
  final VerifyOTPUserCase verifyOTPUserCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc({
    required this.createAccountUserCase,
    required this.emailUseCase,
    required this.verifyOTPUserCase,
    required this.logoutUseCase,
    required this.loginUseCase,
  }) : super(const AuthInitial()) {
    on<CheckLoginEvent>((event, emit) => checkLoginEvent(event, emit));
    on<LogoutEvent>((event, emit) => logoutEvent(event, emit));
    on<EmailEvent>((event, emit) => emailEvent(event, emit));
    on<VerifyOTPEvent>((event, emit) => verifyOTPEvent(event, emit));
    on<CreateAccountEvent>((event, emit) => createAccountEvent(event, emit));
    on<LoginEvent>((event, emit) => loginEvent(event, emit));
  }

  loginEvent(event, emit) async {
    emit(const AuthLoadingState());
    final failureOrCreateAccount = await loginUseCase(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    emit(failureOrCreateAccount.fold(
        (failure) => ErrorAuthState(message: mapFailureToMessage(failure)),
        (authEntity) => LoginState(authEntity: authEntity)));
  }

  createAccountEvent(event, emit) async {
    emit(const AuthLoadingState());
    final failureOrCreateAccount = await createAccountUserCase(
      CreateAccountParams(
        fullname: event.fullname,
        email: event.email,
        password: event.password,
      ),
    );
    emit(failureOrCreateAccount.fold(
        (failure) => ErrorAuthState(message: mapFailureToMessage(failure)),
        (authEntity) => CreateAccountState(authEntity: authEntity)));
  }

  verifyOTPEvent(event, emit) async {
    emit(const AuthLoadingState());
    final failureOrVerifyOtp = await verifyOTPUserCase(VerifyOTPParams(
      otp: event.otp,
      email: event.email,
    ));
    emit(failureOrVerifyOtp.fold(
        (failure) => ErrorAuthState(message: mapFailureToMessage(failure)),
        (otpEntity) => VerifyOTPState(otpEntity: otpEntity)));
  }

  emailEvent(event, emit) async {
    emit(const AuthLoadingState());
    final failureOrEmailEvent = await emailUseCase(
      EmailParams(
        email: event.email,
      ),
    );

    emit(failureOrEmailEvent.fold(
        (failure) => ErrorAuthState(message: mapFailureToMessage(failure)),
        (emailEntity) => EmailState(emailEntity: emailEntity)));
  }

  logoutEvent(event, emit) async {
    emit(const AuthLoadingState());
    final failureOrLogout = await logoutUseCase(LogoutParams());
    emit(failureOrLogout.fold(
        (failure) => ErrorAuthState(message: mapFailureToMessage(failure)),
        (r) => const AuthenticatedState(false)));
  }

  checkLoginEvent(event, emit) async {
    bool isLogin = await isLoggedIn();
    emit(AuthenticatedState(isLogin));
  }

  Future<bool> isLoggedIn() async {
    String? authToken = await storage.read(key: 'jwt');
    return authToken != null && authToken.isNotEmpty;
  }
}
