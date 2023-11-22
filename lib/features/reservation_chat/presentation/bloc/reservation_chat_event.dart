part of 'reservation_chat_bloc.dart';

@immutable
abstract class ReservationChatEvent {}

class ReservationChatInitiated extends ReservationChatEvent {
  final String placeId;
  final String reservationId;

  ReservationChatInitiated({required this.placeId, required this.reservationId});
}

class ReservationChatAddMessageRequested extends ReservationChatEvent {
  final ChatMessage message;

  ReservationChatAddMessageRequested({required this.message});
}