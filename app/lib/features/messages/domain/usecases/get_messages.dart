import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/messages/domain/entities/messages_entity.dart';
import 'package:tak/features/messages/domain/respositories/message_respository.dart';

class GetMessages implements UseCase<List<MessageEntity>, void> {
  final MessageRepository repository;

  GetMessages({required this.repository});
  @override
  Future<Either<Failure, List<MessageEntity>>> call(void params) async {
    return await repository.getMessages();
  }
}
