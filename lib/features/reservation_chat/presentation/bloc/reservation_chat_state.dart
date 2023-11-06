part of 'reservation_chat_bloc.dart';

@immutable
abstract class ReservationChatState {}

class ReservationChatFetchFailure extends ReservationChatState {
  final String errorMessage;

  ReservationChatFetchFailure({required this.errorMessage});
}

class ReservationChatFetchInProgress extends ReservationChatState {
  ReservationChatFetchInProgress();
}

class ReservationChatFetchSuccess extends ReservationChatState {
  final List<ChatMessage> chatMessages;

  ReservationChatFetchSuccess({required this.chatMessages});
}

class ReservationChatAddMessageFailure extends ReservationChatState {
  final String errorMessage;

  ReservationChatAddMessageFailure({required this.errorMessage});
}

class ReservationChatAddMessageInProgress extends ReservationChatState {
  ReservationChatAddMessageInProgress();
}

class ReservationChatAddMessageSuccess extends ReservationChatState {}