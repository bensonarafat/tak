part of 'setup_bloc.dart';

@immutable
abstract class SetupEvent extends Equatable {}

class AccountSelectSetupEvent extends SetupEvent {
  final String role;
  final String status;

  AccountSelectSetupEvent({
    required this.role,
    required this.status,
  });

  @override
  List<Object?> get props => [
        role,
        status,
      ];
}

class AccountSelectHouseEvent extends SetupEvent {
  final String houseId;
  final String status;
  final String role;

  AccountSelectHouseEvent({
    required this.houseId,
    required this.role,
    required this.status,
  });

  @override
  List<Object?> get props => [houseId, role, status];
}

class FetchHousesEvent extends SetupEvent {
  @override
  List<Object?> get props => [];
}

class FetchSetupUserDataEvent extends SetupEvent {
  @override
  List<Object?> get props => [];
}
