part of 'service_request_bloc.dart';

@immutable
abstract class ServiceRequestEvent extends Equatable {}

class AddServiceRequestEvent extends ServiceRequestEvent {
  final String name;
  final String priority;
  final String description;
  final String houseId;
  final String section;
  final List<String> location;
  final List<String> maintenance;

  AddServiceRequestEvent({
    required this.name,
    required this.priority,
    required this.description,
    required this.houseId,
    required this.location,
    required this.section,
    required this.maintenance,
  });

  @override
  List<Object?> get props =>
      [name, priority, description, houseId, location, section, maintenance];
}

class EditServiceRequestEvent extends ServiceRequestEvent {
  final String section;
  final List<String> location;
  final List<String> maintenance;
  final String name;
  final String priority;
  final String description;
  final String id;

  EditServiceRequestEvent({
    required this.location,
    required this.section,
    required this.maintenance,
    required this.name,
    required this.priority,
    required this.description,
    required this.id,
  });

  @override
  List<Object?> get props =>
      [location, section, maintenance, name, priority, description];
}

class GetEquipmentRequestEvent extends ServiceRequestEvent {
  final String houseId;

  GetEquipmentRequestEvent({
    required this.houseId,
  });

  @override
  List<Object?> get props => [houseId];
}

class GetServiceRequestsEvent extends ServiceRequestEvent {
  @override
  List<Object?> get props => [];
}
