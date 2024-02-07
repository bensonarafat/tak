import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/service_request/domain/entities/equipment_entity.dart';
import 'package:tak/features/service_request/domain/entities/service_request_entity.dart';
import 'package:tak/features/service_request/domain/entities/service_requests_entity.dart';
import 'package:tak/features/service_request/domain/usecases/add_request_usecase.dart';
import 'package:tak/features/service_request/domain/usecases/edit_request_usecase.dart';
import 'package:tak/features/service_request/domain/usecases/get_equipment_usecase.dart';
import 'package:tak/features/service_request/domain/usecases/get_service_request_usecase.dart';

part 'service_request_event.dart';
part 'service_request_state.dart';

class ServiceRequestBloc
    extends Bloc<ServiceRequestEvent, ServiceRequestState> {
  final AddRequestUseCase addRequestUseCase;
  final EditRequestUseCase editRequestUseCase;
  final GetEquipmentUseCase getEquipmentUseCase;
  final GetServiceRequestUseCase getServiceRequestUseCase;
  ServiceRequestBloc({
    required this.editRequestUseCase,
    required this.addRequestUseCase,
    required this.getEquipmentUseCase,
    required this.getServiceRequestUseCase,
  }) : super(ServiceRequestInitState()) {
    on<AddServiceRequestEvent>((event, emit) => addServiceRequest(event, emit));
    on<EditServiceRequestEvent>(
        (event, emit) => editServiceRequest(event, emit));
    on<GetEquipmentRequestEvent>(
        (event, emit) => getEquipmentRequestEvent(event, emit));
    on<GetServiceRequestsEvent>(
        (event, emit) => getServiceRequestsEvent(event, emit));
  }

  getServiceRequestsEvent(event, emit) async {
    emit(ServiceRequestLoadingState());

    final failureOrCreate = await getServiceRequestUseCase({});

    emit(failureOrCreate.fold(
        (failure) =>
            ServiceRequestErrorState(message: mapFailureToMessage(failure)),
        (servicesRequests) =>
            ServiceRequestsLoadedState(servicesRequests: servicesRequests)));
  }

  getEquipmentRequestEvent(event, emit) async {
    emit(ServiceRequestLoadingState());

    final failureOrCreate = await getEquipmentUseCase(
      EquipmentParams(
        houseId: event.houseId,
      ),
    );

    emit(failureOrCreate.fold(
        (failure) =>
            ServiceRequestErrorState(message: mapFailureToMessage(failure)),
        (equipmentEntity) =>
            EquipmentRequestLoadedState(equipmentEntity: equipmentEntity)));
  }

  addServiceRequest(event, emit) async {
    emit(ServiceRequestLoadingState());

    final failureOrCreate = await addRequestUseCase(
      ServiceRequestParams(
        name: event.name,
        priority: event.priority,
        description: event.description,
        houseId: event.houseId,
        section: event.section,
        location: event.location,
        maintenance: event.maintenance,
      ),
    );

    emit(failureOrCreate.fold(
        (failure) =>
            ServiceRequestErrorState(message: mapFailureToMessage(failure)),
        (serviceRequestEntity) => ServiceRequestLoadedState(
            serviceRequestEntity: serviceRequestEntity)));
  }

  editServiceRequest(event, emit) async {
    emit(ServiceRequestLoadingState());

    final failureOrCreate = await editRequestUseCase(
      EditServiceRequestParams(
        name: event.name,
        priority: event.priority,
        description: event.description,
        id: event.id,
        section: event.section,
        location: event.location,
        maintenance: event.maintenance,
      ),
    );

    emit(failureOrCreate.fold(
        (failure) =>
            ServiceRequestErrorState(message: mapFailureToMessage(failure)),
        (serviceRequestEntity) => ServiceRequestLoadedState(
            serviceRequestEntity: serviceRequestEntity)));
  }
}
