import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak/core/domain/entities/user_entity.dart';
import 'package:tak/core/domain/usecases/fetch_user_data_usecase.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/setup/domain/entities/account_select_entity.dart';
import 'package:tak/features/setup/domain/entities/house_entity.dart';
import 'package:tak/features/setup/domain/usecases/account_select_usecase.dart';
import 'package:tak/features/setup/domain/usecases/fetch_houses_usecase.dart';
import 'package:tak/features/setup/domain/usecases/select_house_usecase.dart';

part 'setup_event.dart';
part 'setup_state.dart';

class SetUpBloc extends Bloc<SetupEvent, SetupState> {
  AccountSelectUseCase accountSelectUseCase;
  SelectHouseUseCase selectHouseUseCase;
  FetchHousesUseCase fetchHousesUseCase;
  FetchUserDataUseCase fetchUserDataUseCase;
  SetUpBloc({
    required this.accountSelectUseCase,
    required this.selectHouseUseCase,
    required this.fetchHousesUseCase,
    required this.fetchUserDataUseCase,
  }) : super(SetupInitialState()) {
    on<AccountSelectSetupEvent>((event, emit) => accountSelected(event, emit));
    on<AccountSelectHouseEvent>(
        (event, emit) => accountSelectHouse(event, emit));
    on<FetchHousesEvent>((event, emit) => fetchHouses(event, emit));
    on<FetchSetupUserDataEvent>((event, emit) => fetchUserData(event, emit));
  }

  fetchUserData(event, emit) async {
    emit(SetupLoadingState());
    final failureOrCreate = await fetchUserDataUseCase({});
    emit(failureOrCreate.fold(
        (failure) => SetupErrorState(message: mapFailureToMessage(failure)),
        (userEntity) => FetchSetupUserDataState(userEntity: userEntity)));
  }

  fetchHouses(event, emit) async {
    emit(SetupLoadingState());
    final failureOrCreate = await fetchHousesUseCase({});

    emit(failureOrCreate.fold(
        (failure) => SetupErrorState(message: mapFailureToMessage(failure)),
        (housesEntity) => FetchHousesLoadedState(housesEntity: housesEntity)));
  }

  accountSelected(event, emit) async {
    emit(SetupLoadingState());
    final failureOrCreate = await accountSelectUseCase(
      AccountSelectParams(
        role: event.role,
        status: event.status,
      ),
    );

    emit(failureOrCreate.fold(
        (failure) => SetupErrorState(message: mapFailureToMessage(failure)),
        (accountSelectEntity) =>
            SetupLoadedState(accountSelectEntity: accountSelectEntity)));
  }

  accountSelectHouse(event, emit) async {
    emit(SetupLoadingState());

    final failureOrCreate = await selectHouseUseCase(
      SelectHouseParams(
        houseId: event.houseId,
        role: event.role,
        status: event.status,
      ),
    );

    emit(failureOrCreate.fold(
        (failure) => SetupErrorState(message: mapFailureToMessage(failure)),
        (accountSelectEntity) =>
            SetupLoadedState(accountSelectEntity: accountSelectEntity)));
  }
}
