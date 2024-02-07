import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/visitors/domain/entities/visitors_entity.dart';
import 'package:tak/features/visitors/domain/entities/visitor_entity.dart';
import 'package:tak/features/visitors/domain/usecases/add_visitor_usecase.dart';
import 'package:tak/features/visitors/domain/usecases/edit_visitor_usecase.dart';
import 'package:tak/features/visitors/domain/usecases/get_visitors_usecase.dart';

part 'visitors_event.dart';
part 'visitors_state.dart';

class VisitorsBloc extends Bloc<VisitorEvent, VisitorState> {
  final AddVisitorUseCase addVisitorUseCase;
  final EditVisitorUseCase editVisitorUseCase;
  final GetVisitorsUseCase getVisisotrsUseCase;
  VisitorsBloc({
    required this.editVisitorUseCase,
    required this.addVisitorUseCase,
    required this.getVisisotrsUseCase,
  }) : super(VisitorInitState()) {
    on<AddVisitorEvent>((event, emit) => addVisitorEvent(event, emit));
    on<EditVisitorEvent>((event, emit) => editVisitorEvent(event, emit));
    on<GetVisitorsEvent>((event, emit) => getVisitorsEvent(event, emit));
  }

  getVisitorsEvent(event, emit) async {
    emit(VisitorLoadingState());
    final failureOrGet = await getVisisotrsUseCase({});

    emit(failureOrGet.fold(
        (failure) => VisitorErrorState(message: mapFailureToMessage(failure)),
        (visitorsEntity) =>
            VisitorsLoadedState(visitorsEntity: visitorsEntity)));
  }

  addVisitorEvent(event, emit) async {
    emit(VisitorLoadingState());

    final failureOrCreate = await addVisitorUseCase(
      VisitorParams(
        phone: event.phone,
        arrival: event.arrival,
        departure: event.departure,
        carRegno: event.carRegno,
        destination: event.destination,
        reason: event.reason,
        visitorName: event.visitorName,
      ),
    );

    emit(failureOrCreate.fold(
        (failure) => VisitorErrorState(message: mapFailureToMessage(failure)),
        (visitorEntity) => VisitorLoadedState(visitorEntity: visitorEntity)));
  }

  editVisitorEvent(event, emit) async {
    emit(VisitorLoadingState());

    final failureOrCreate = await editVisitorUseCase(
      EditVisitorParams(
        phone: event.phone,
        arrival: event.arrival,
        departure: event.departure,
        carRegno: event.carRegno,
        destination: event.destination,
        reason: event.reason,
        visitorName: event.visitorName,
        id: event.id,
      ),
    );

    emit(failureOrCreate.fold(
        (failure) => VisitorErrorState(message: mapFailureToMessage(failure)),
        (visitorEntity) => VisitorLoadedState(visitorEntity: visitorEntity)));
  }
}
