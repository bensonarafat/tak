part of 'message_bloc.dart';

@immutable
abstract class MessageState extends Equatable {}

class MessageInitState extends MessageState {
  @override
  List<Object?> get props => [];
}

class MessageLoadingState extends MessageState {
  @override
  List<Object?> get props => [];
}

class MessageLoadedState extends MessageState {
  final List<MessageEntity> messages;

  MessageLoadedState({required this.messages});
  @override
  List<Object?> get props => [messages];
}

class MessageErrorState extends MessageState {
  final String message;

  MessageErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
