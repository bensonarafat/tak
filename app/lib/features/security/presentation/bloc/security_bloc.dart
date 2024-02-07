import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/security/domain/entities/check_entity.dart';
import 'package:tak/features/security/domain/entities/security_visitors_entity.dart';
import 'package:tak/features/security/domain/usecases/checkin_usecase.dart';
import 'package:tak/features/security/domain/usecases/checkout_usecase.dart';
import 'package:tak/features/security/domain/usecases/get_security_visitors_usecase.dart';

part 'security_event.dart';
part 'security_state.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState> {
  GetSecurityVisitorsUseCase visitorsUseCase;
  CheckInUseCase checkinUseCase;
  CheckOutUseCase checkoutUseCase;
  SecurityBloc({
    required this.visitorsUseCase,
    required this.checkinUseCase,
    required this.checkoutUseCase,
  }) : super(SecurityLoadingState()) {
    on<FetchVisitorsEvent>((event, emit) => fetchVisitorsEvent(event, emit));
    on<CheckOutEvent>((event, emit) => checkOutEvent(event, emit));
    on<CheckInEvent>((event, emit) => checkInEvent(event, emit));
  }

  checkOutEvent(event, emit) async {
    emit(SecurityCheckLoadingState());
    final failureOrGet =
        await checkoutUseCase(CheckParams(visitorId: event.visitorId));

    emit(failureOrGet.fold(
        (failure) =>
            SecurityCheckErrorState(message: mapFailureToMessage(failure)),
        (checkEntity) => SecurityCheckLoadedState(checkEntity: checkEntity)));
  }

  checkInEvent(event, emit) async {
    emit(SecurityCheckLoadingState());
    final failureOrGet =
        await checkinUseCase(CheckParams(visitorId: event.visitorId));

    emit(failureOrGet.fold(
        (failure) =>
            SecurityCheckErrorState(message: mapFailureToMessage(failure)),
        (checkEntity) => SecurityCheckLoadedState(checkEntity: checkEntity)));
  }

  fetchVisitorsEvent(event, emit) async {
    emit(SecurityLoadingState());
    final failureOrGet = await visitorsUseCase({});

    emit(failureOrGet.fold(
        (failure) => SecurityErrorState(message: mapFailureToMessage(failure)),
        (visitors) => SecurityLoadedState(visitors: visitors)));
  }
}
