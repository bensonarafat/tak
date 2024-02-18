import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/features/messages/domain/entities/messages_entity.dart';

abstract class MessageRepository {
  Future<Either<Failure, List<MessageEntity>>> getMessages();
}
