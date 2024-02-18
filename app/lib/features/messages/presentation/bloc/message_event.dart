part of 'message_bloc.dart';

@immutable
abstract class MessageEvent extends Equatable {}

class FetchMessagesEvent extends MessageEvent {
  @override
  List<Object?> get props => [];
}
