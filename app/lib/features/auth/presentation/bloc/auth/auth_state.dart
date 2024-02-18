part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginState extends AuthState {
  final AuthEntity authEntity;
  LoginState({
    required this.authEntity,
  });

  @override
  List<Object> get props => [authEntity];
}

class EmailState extends AuthState {
  final EmailEntity emailEntity;

  EmailState({
    required this.emailEntity,
  });

  @override
  List<Object> get props => [emailEntity];
}

class VerifyOTPState extends AuthState {
  final OTPEntity otpEntity;

  VerifyOTPState({required this.otpEntity});

  @override
  List<Object> get props => [otpEntity];
}

class CreateAccountState extends AuthState {
  final AuthEntity authEntity;

  CreateAccountState({required this.authEntity});
  @override
  List<Object> get props => [authEntity];
}

class LogoutState extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ErrorAuthState extends AuthState {
  final String message;
  ErrorAuthState({required this.message});
  @override
  List<Object> get props => [message];
}

class AuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}
