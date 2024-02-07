part of 'service_request_bloc.dart';

@immutable
abstract class ServiceRequestState extends Equatable {}

class ServiceRequestLoadingState extends ServiceRequestState {
  @override
  List<Object?> get props => [];
}

class ServiceRequestInitState extends ServiceRequestState {
  @override
  List<Object?> get props => [];
}

class ServiceRequestLoadedState extends ServiceRequestState {
  final ServiceRequestEntity serviceRequestEntity;

  ServiceRequestLoadedState({required this.serviceRequestEntity});
  @override
  List<Object?> get props => throw [serviceRequestEntity];
}

class EquipmentRequestLoadedState extends ServiceRequestState {
  final List<EquipmentEntity> equipmentEntity;

  EquipmentRequestLoadedState({required this.equipmentEntity});
  @override
  List<Object?> get props => [equipmentEntity];
}

class ServiceRequestErrorState extends ServiceRequestState {
  final String message;

  ServiceRequestErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServiceRequestsLoadedState extends ServiceRequestState {
  final List<ServiceRequestsEntity> servicesRequests;

  ServiceRequestsLoadedState({required this.servicesRequests});
  @override
  List<Object?> get props => [servicesRequests];
}
