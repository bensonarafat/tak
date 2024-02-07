part of 'security_bloc.dart';

abstract class SecurityEvent extends Equatable {}

class FetchVisitorsEvent extends SecurityEvent {
  @override
  List<Object?> get props => [];
}

class CheckOutEvent extends SecurityEvent {
  final String visitorId;

  CheckOutEvent({required this.visitorId});
  @override
  List<Object?> get props => [visitorId];
}

class CheckInEvent extends SecurityEvent {
  final String visitorId;

  CheckInEvent({required this.visitorId});
  @override
  List<Object?> get props => [visitorId];
}
