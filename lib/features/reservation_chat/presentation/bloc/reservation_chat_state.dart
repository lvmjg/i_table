part of 'reservation_chat_bloc.dart';

@immutable
abstract class ReservationChatState {}

class ReservationChatFetchFailure extends ReservationChatState {
  final ErrorParams params;

  ReservationChatFetchFailure({required this.params});
}

class ReservationChatFetchInProgress extends ReservationChatState {
  ReservationChatFetchInProgress();
}

class ReservationChatFetchSuccess extends ReservationChatState implements SuccessState {
  final List<ChatMessage> messages;

  ReservationChatFetchSuccess({required this.messages});
}

class ReservationChatAddMessageFailure extends ReservationChatState {
  final ErrorParams params;

  ReservationChatAddMessageFailure({required this.params});
}

class ReservationChatAddMessageInProgress extends ReservationChatState {}

class ReservationChatAddMessageSuccess extends ReservationChatState implements SuccessState {}
