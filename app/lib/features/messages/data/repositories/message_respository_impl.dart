import 'package:dartz/dartz.dart';
import 'package:tak/core/connection/network_info.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/messages/data/datasource/message_data_source.dart';
import 'package:tak/features/messages/data/models/message_model.dart';
import 'package:tak/features/messages/domain/respositories/message_respository.dart';

class MessageRepositoryImp implements MessageRepository {
  NetworkInfo networkInfo;
  SecureStorage secureStorage;
  MessageDataSource dataSource;

  MessageRepositoryImp({
    required this.networkInfo,
    required this.secureStorage,
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<MessageModel>>> getMessages() async {
    if (await networkInfo.isConnected) {
      try {
        List<MessageModel> model = await dataSource.getMessages();

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
