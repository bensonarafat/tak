import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:tak/core/connection/network_info.dart';
import 'package:tak/core/data/datasources/remote_user_data_source.dart';
import 'package:tak/core/data/repositories/user_repository_impl.dart';
import 'package:tak/core/domain/repositories/user_repository.dart';
import 'package:tak/core/domain/usecases/fetch_user_data_usecase.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:tak/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tak/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tak/features/auth/domain/repositories/auth_repository.dart';
import 'package:tak/features/auth/domain/usecases/auth.dart';
import 'package:tak/features/auth/domain/usecases/create_account.dart';
import 'package:tak/features/auth/domain/usecases/logout.dart';
import 'package:tak/features/auth/domain/usecases/email.dart';
import 'package:tak/features/auth/domain/usecases/verify_otp.dart';
import 'package:tak/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tak/features/security/data/datasources/security_datasource.dart';
import 'package:tak/features/security/data/repositories/security_repository_impl.dart';
import 'package:tak/features/security/domain/repositories/security_repositories.dart';
import 'package:tak/features/security/domain/usecases/checkin_usecase.dart';
import 'package:tak/features/security/domain/usecases/checkout_usecase.dart';
import 'package:tak/features/security/domain/usecases/get_security_visitors_usecase.dart';
import 'package:tak/features/security/presentation/bloc/security_bloc.dart';
import 'package:tak/features/service_request/data/datasources/service_request_datasource.dart';
import 'package:tak/features/service_request/data/repositories/service_request_repository_impl.dart';
import 'package:tak/features/service_request/domain/repositories/service_request_repository.dart';
import 'package:tak/features/service_request/domain/usecases/add_request_usecase.dart';
import 'package:tak/features/service_request/domain/usecases/edit_request_usecase.dart';
import 'package:tak/features/service_request/domain/usecases/get_equipment_usecase.dart';
import 'package:tak/features/service_request/domain/usecases/get_service_request_usecase.dart';
import 'package:tak/features/service_request/presentation/bloc/service_request_bloc.dart';
import 'package:tak/features/setup/data/datasources/setup_remote_data_source.dart';
import 'package:tak/features/setup/data/repositories/setup_repository_impl.dart';
import 'package:tak/features/setup/domain/repositories/setup_repository.dart';
import 'package:tak/features/setup/domain/usecases/account_select_usecase.dart';
import 'package:tak/features/setup/domain/usecases/fetch_houses_usecase.dart';
import 'package:tak/features/setup/domain/usecases/select_house_usecase.dart';
import 'package:tak/features/setup/presentation/bloc/setup_bloc.dart';
import 'package:tak/features/visitors/data/datasources/visitor_datasource.dart';
import 'package:tak/features/visitors/data/repositories/visitor_repository_impl.dart';
import 'package:tak/features/visitors/domain/repositories/visitor_repository.dart';
import 'package:tak/features/visitors/domain/usecases/add_visitor_usecase.dart';
import 'package:tak/features/visitors/domain/usecases/edit_visitor_usecase.dart';
import 'package:tak/features/visitors/domain/usecases/get_visitors_usecase.dart';
import 'package:tak/features/visitors/presentation/bloc/visitors_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
/**
 * -----------------------------------------------------------------------------------------------------------
 */

  //auth
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      createAccountUserCase: getIt(),
      emailUseCase: getIt(),
      verifyOTPUserCase: getIt(),
      logoutUseCase: getIt(),
      loginUseCase: getIt(),
    ),
  );

  // usescases
  getIt.registerLazySingleton<EmailUseCase>(
      () => EmailUseCase(repository: getIt()));
  getIt.registerLazySingleton<CreateAccountUserCase>(
      () => CreateAccountUserCase(repository: getIt()));
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: getIt()));
  getIt.registerLazySingleton<VerifyOTPUserCase>(
      () => VerifyOTPUserCase(repository: getIt()));
  getIt.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(repository: getIt()));

  // repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: getIt(),
      localDataSource: getIt(),
      remoteDataSource: getIt(),
      secureStorage: getIt(),
      userDataSource: getIt(),
    ),
  );

  //datasources
  final client = http.Client();
  getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl());
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
            client: client,
            secureStorage: getIt(),
          ));

  // network
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //external
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  //storage
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());

  getIt.registerLazySingleton<UserDataSource>(
      () => UserDataSource(secureStorage: getIt(), client: client));

  getIt.registerLazySingleton<Logger>(() => Logger());

  //setup
  getIt.registerFactory<SetUpBloc>(
    () => SetUpBloc(
      accountSelectUseCase: getIt(),
      selectHouseUseCase: getIt(),
      fetchHousesUseCase: getIt(),
      fetchUserDataUseCase: getIt(),
    ),
  );

  // usescases
  getIt.registerLazySingleton<AccountSelectUseCase>(
      () => AccountSelectUseCase(repository: getIt()));
  getIt.registerLazySingleton<SelectHouseUseCase>(
      () => SelectHouseUseCase(repository: getIt()));
  getIt.registerLazySingleton<FetchHousesUseCase>(
      () => FetchHousesUseCase(repository: getIt()));
  getIt.registerLazySingleton<FetchUserDataUseCase>(
      () => FetchUserDataUseCase(repository: getIt()));

  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
        secureStorage: getIt(),
      ));
  // repository
  getIt.registerLazySingleton<SetupRepository>(
    () => SetupRepositoryImpl(
      networkInfo: getIt(),
      remoteDataSource: getIt(),
      secureStorage: getIt(),
      userDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<SetupRemoteDataSource>(
    () => SetupRemoteDataSourceImp(
      secureStorage: getIt(),
      client: client,
    ),
  );

  /**
   * -----------------------------------------------------------------------------------------------------------
   * service request
   */
  getIt.registerFactory<ServiceRequestBloc>(
    () => ServiceRequestBloc(
      editRequestUseCase: getIt(),
      addRequestUseCase: getIt(),
      getEquipmentUseCase: getIt(),
      getServiceRequestUseCase: getIt(),
    ),
  );

  // usescases
  getIt.registerLazySingleton<EditRequestUseCase>(
      () => EditRequestUseCase(repository: getIt()));
  getIt.registerLazySingleton<AddRequestUseCase>(
      () => AddRequestUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetEquipmentUseCase>(
      () => GetEquipmentUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetServiceRequestUseCase>(
      () => GetServiceRequestUseCase(repository: getIt()));
  // repository
  getIt.registerLazySingleton<ServiceRequestRepository>(
    () => ServiceRequestRepositoryImpl(
      networkInfo: getIt(),
      secureStorage: getIt(),
      dataSource: getIt(),
    ),
  );

  //datasources
  getIt.registerLazySingleton<ServiceRequestDataSource>(
    () => ServiceRequestDataSourceImp(
      client: client,
      secureStorage: getIt(),
    ),
  );

  /**
   * -----------------------------------------------------------------------------------------------------------
   * Visitor
   */
  getIt.registerFactory<VisitorsBloc>(
    () => VisitorsBloc(
      editVisitorUseCase: getIt(),
      addVisitorUseCase: getIt(),
      getVisisotrsUseCase: getIt(),
    ),
  );

  // usescases
  getIt.registerLazySingleton<EditVisitorUseCase>(
      () => EditVisitorUseCase(repository: getIt()));
  getIt.registerLazySingleton<AddVisitorUseCase>(
      () => AddVisitorUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetVisitorsUseCase>(
      () => GetVisitorsUseCase(repository: getIt()));

  // repository
  getIt.registerLazySingleton<VisitorRepository>(
    () => VisitorRepositoryImpl(
      networkInfo: getIt(),
      secureStorage: getIt(),
      dataSource: getIt(),
    ),
  );

  //datasources
  getIt.registerLazySingleton<VisitorDataSource>(
    () => VisitorDataSourceImpl(
      client: client,
      secureStorage: getIt(),
    ),
  );

  /**
   * -----------------------------------------------------------------------------------------------------------
   * Security
   */
  getIt.registerFactory<SecurityBloc>(
    () => SecurityBloc(
      visitorsUseCase: getIt(),
      checkinUseCase: getIt(),
      checkoutUseCase: getIt(),
    ),
  );

  // usescases
  getIt.registerLazySingleton<GetSecurityVisitorsUseCase>(
      () => GetSecurityVisitorsUseCase(repository: getIt()));
  getIt.registerLazySingleton<CheckOutUseCase>(
      () => CheckOutUseCase(repository: getIt()));
  getIt.registerLazySingleton<CheckInUseCase>(
      () => CheckInUseCase(repository: getIt()));
  // repository
  getIt.registerLazySingleton<SecurityRepository>(
    () => SecurityRepositoryImpl(
      networkInfo: getIt(),
      secureStorage: getIt(),
      dataSource: getIt(),
    ),
  );

  //datasources
  getIt.registerLazySingleton<SecurityDataSource>(
    () => SecurityDataSourceImpl(
      client: client,
      secureStorage: getIt(),
    ),
  );
}
