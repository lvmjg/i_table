part of 'reservation_chat_bloc.dart';

@immutable
abstract class ReservationChatEvent {}

class ReservationChatInitiated extends ReservationChatEvent {}

class ReservationChatAddMessageRequested extends ReservationChatEvent {
  final ChatMessage message;

  ReservationChatAddMessageRequested({required this.message});
}
