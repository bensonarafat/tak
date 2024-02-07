part of 'visitors_bloc.dart';

@immutable
abstract class VisitorEvent extends Equatable {}

class AddVisitorEvent extends VisitorEvent {
  final String phone;
  final String arrival;
  final String departure;
  final String carRegno;
  final String reason;
  final String destination;
  final String visitorName;

  AddVisitorEvent({
    required this.phone,
    required this.arrival,
    required this.departure,
    required this.carRegno,
    required this.reason,
    required this.destination,
    required this.visitorName,
  });

  @override
  List<Object?> get props => [
        phone,
        arrival,
        departure,
        carRegno,
        reason,
        destination,
        visitorName,
      ];
}

class EditVisitorEvent extends VisitorEvent {
  final String phone;
  final String arrival;
  final String departure;
  final String carRegno;
  final String reason;
  final String destination;
  final String visitorName;
  final String id;

  EditVisitorEvent({
    required this.phone,
    required this.arrival,
    required this.departure,
    required this.carRegno,
    required this.reason,
    required this.destination,
    required this.visitorName,
    required this.id,
  });

  @override
  List<Object?> get props => [
        phone,
        arrival,
        departure,
        carRegno,
        reason,
        destination,
        visitorName,
        id,
      ];
}

class GetVisitorsEvent extends VisitorEvent {
  @override
  List<Object?> get props => [];
}
