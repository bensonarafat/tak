part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckLoginEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {
  LogoutEvent();

  @override
  List<Object> get props => [];
}

class EmailEvent extends AuthEvent {
  final String email;

  EmailEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class VerifyOTPEvent extends AuthEvent {
  final String otp;
  final String email;
  VerifyOTPEvent({
    required this.otp,
    required this.email,
  });

  @override
  List<Object> get props => [
        otp,
        email,
      ];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class CreateAccountEvent extends AuthEvent {
  final String fullname;
  final String email;
  final String password;

  CreateAccountEvent({
    required this.fullname,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [fullname, email, password];
}
