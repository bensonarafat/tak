part of 'security_bloc.dart';

abstract class SecurityState extends Equatable {}

class SecurityInitState extends SecurityState {
  @override
  List<Object?> get props => [];
}

class SecurityErrorState extends SecurityState {
  final String message;

  SecurityErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class SecurityLoadingState extends SecurityState {
  @override
  List<Object?> get props => [];
}

class SecurityLoadedState extends SecurityState {
  final List<SecurityVisitorEntity> visitors;

  SecurityLoadedState({required this.visitors});
  @override
  List<Object?> get props => [visitors];
}

class SecurityCheckErrorState extends SecurityState {
  final String message;

  SecurityCheckErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

class SecurityCheckLoadedState extends SecurityState {
  final CheckEntity checkEntity;

  SecurityCheckLoadedState({required this.checkEntity});
  @override
  List<Object?> get props => [checkEntity];
}

class SecurityCheckLoadingState extends SecurityState {
  @override
  List<Object?> get props => [];
}
