import 'package:dartz/dartz.dart';
import 'package:tak/core/connection/network_info.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/notification/data/datasource/notification_data_source.dart';
import 'package:tak/features/notification/data/models/notification_model.dart';
import 'package:tak/features/notification/domain/respositories/notification_respository.dart';

class NotificationRepositoryImp implements NotificationRepository {
  NetworkInfo networkInfo;
  SecureStorage secureStorage;
  NotificationDataSource dataSource;

  NotificationRepositoryImp({
    required this.networkInfo,
    required this.secureStorage,
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async {
    if (await networkInfo.isConnected) {
      try {
        List<NotificationModel> model = await dataSource.getNotifications();

        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }
}
