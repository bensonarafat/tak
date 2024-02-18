import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/notification/domain/entities/notifications_entity.dart';
import 'package:tak/features/notification/domain/usecases/get_notifications.dart';

part 'notification_state.dart';
part 'notification_event.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotifications getNotifications;
  NotificationBloc({
    required this.getNotifications,
  }) : super(NotificationInitState()) {
    on<FetchNotificationsEvent>(
        (event, emit) => fetchNotificationEvent(event, emit));
  }

  fetchNotificationEvent(event, emit) async {
    emit(NotificationLoadingState());
    final failureOrGet = await getNotifications({});

    emit(failureOrGet.fold(
        (failure) =>
            NotificationErrorState(message: mapFailureToMessage(failure)),
        (notifications) =>
            NotificationLoadedState(notifications: notifications)));
  }
}
