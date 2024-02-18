part of 'notification_bloc.dart';

@immutable
abstract class NotificationState extends Equatable {}

class NotificationInitState extends NotificationState {
  @override
  List<Object?> get props => [];
}

class NotificationLoadingState extends NotificationState {
  @override
  List<Object?> get props => [];
}

class NotificationLoadedState extends NotificationState {
  final List<NotificationEntity> notifications;

  NotificationLoadedState({required this.notifications});
  @override
  List<Object?> get props => [notifications];
}

class NotificationErrorState extends NotificationState {
  final String message;

  NotificationErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
