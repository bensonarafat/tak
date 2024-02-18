part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent extends Equatable {}

class FetchNotificationsEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];
}
