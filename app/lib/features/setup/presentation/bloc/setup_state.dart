part of 'setup_bloc.dart';

@immutable
abstract class SetupState extends Equatable {}

class SetupInitialState extends SetupState {
  @override
  List<Object?> get props => [];
}

class SetupLoadingState extends SetupState {
  SetupLoadingState();

  @override
  List<Object?> get props => [];
}

class SetupLoadedState extends SetupState {
  final AccountSelectEntity accountSelectEntity;
  SetupLoadedState({required this.accountSelectEntity});

  @override
  List<Object?> get props => [accountSelectEntity];
}

class FetchHousesLoadedState extends SetupState {
  final List<HousesEntity> housesEntity;
  FetchHousesLoadedState({required this.housesEntity});

  @override
  List<Object?> get props => [housesEntity];
}

class SetupErrorState extends SetupState {
  final String message;
  SetupErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class FetchSetupUserDataState extends SetupState {
  final UserEntity userEntity;

  FetchSetupUserDataState({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}
