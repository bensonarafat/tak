import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/messages/domain/entities/messages_entity.dart';
import 'package:tak/features/messages/domain/usecases/get_messages.dart';

part 'message_state.dart';
part 'message_event.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetMessages getMessages;
  MessageBloc({
    required this.getMessages,
  }) : super(MessageInitState()) {
    on<FetchMessagesEvent>((event, emit) => fetchMessageEvent(event, emit));
  }

  fetchMessageEvent(event, emit) async {
    emit(MessageLoadingState());
    final failureOrGet = await getMessages({});

    emit(failureOrGet.fold(
        (failure) => MessageErrorState(message: mapFailureToMessage(failure)),
        (messages) => MessageLoadedState(messages: messages)));
  }
}
