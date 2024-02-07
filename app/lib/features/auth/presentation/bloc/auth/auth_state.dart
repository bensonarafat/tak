part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  final bool isLogin;
  const AuthState(this.isLogin);
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(false);
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState() : super(false);
}

class LoginState extends AuthState {
  final AuthEntity authEntity;
  const LoginState({
    required this.authEntity,
  }) : super(false);

  @override
  List<Object> get props => [authEntity];
}

class EmailState extends AuthState {
  final EmailEntity emailEntity;

  const EmailState({
    required this.emailEntity,
  }) : super(false);

  @override
  List<Object> get props => [emailEntity];
}

class VerifyOTPState extends AuthState {
  final OTPEntity otpEntity;

  const VerifyOTPState({required this.otpEntity}) : super(false);

  @override
  List<Object> get props => [otpEntity];
}

class CreateAccountState extends AuthState {
  final AuthEntity authEntity;

  const CreateAccountState({required this.authEntity}) : super(false);
  @override
  List<Object> get props => [authEntity];
}

class LogoutState extends AuthState {
  const LogoutState(super.isLogin);
}

class ErrorAuthState extends AuthState {
  final String message;
  const ErrorAuthState({required this.message}) : super(false);
  @override
  List<Object> get props => [message];
}

class AuthenticatedState extends AuthState {
  const AuthenticatedState(bool isLogin) : super(isLogin);
}
