import 'package:dartz/dartz.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/usecases/usecase.dart';
import 'package:tak/features/notification/domain/entities/notifications_entity.dart';
import 'package:tak/features/notification/domain/respositories/notification_respository.dart';

class GetNotifications implements UseCase<List<NotificationEntity>, void> {
  final NotificationRepository repository;

  GetNotifications({required this.repository});
  @override
  Future<Either<Failure, List<NotificationEntity>>> call(void params) async {
    return await repository.getNotifications();
  }
}
