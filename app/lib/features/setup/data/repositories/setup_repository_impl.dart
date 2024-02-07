import 'package:dartz/dartz.dart';
import 'package:tak/core/connection/network_info.dart';
import 'package:tak/core/data/datasources/remote_user_data_source.dart';
import 'package:tak/core/data/models/user_model.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/setup/data/datasources/setup_remote_data_source.dart';
import 'package:tak/features/setup/data/model/account_select_model.dart';
import 'package:tak/features/setup/data/model/houses_model.dart';
import 'package:tak/features/setup/domain/repositories/setup_repository.dart';

class SetupRepositoryImpl implements SetupRepository {
  SetupRemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;
  SecureStorage secureStorage;
  UserDataSource userDataSource;

  SetupRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.secureStorage,
    required this.userDataSource,
  });
  @override
  Future<Either<Failure, AccountSelectModel>> selectAccount(params) async {
    if (await networkInfo.isConnected) {
      try {
        AccountSelectModel accountSelectModel =
            await remoteDataSource.selectAccount(params);
        // get data and save to device
        UserModel userModel = await userDataSource.getUserData();
        secureStorage.saveUserData(userModel);
        return Right(accountSelectModel);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, AccountSelectModel>> selectHouse(params) async {
    if (await networkInfo.isConnected) {
      try {
        AccountSelectModel accountSelectModel =
            await remoteDataSource.selectHouse(params);
        // get data and save to device
        UserModel userModel = await userDataSource.getUserData();
        secureStorage.saveUserData(userModel);
        return Right(accountSelectModel);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<HousesModel>>> getHouses() async {
    if (await networkInfo.isConnected) {
      try {
        List<HousesModel> houses = await remoteDataSource.fetchHouses();
        // get data and save to device
        UserModel userModel = await userDataSource.getUserData();
        secureStorage.saveUserData(userModel);
        return Right(houses);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }
}
