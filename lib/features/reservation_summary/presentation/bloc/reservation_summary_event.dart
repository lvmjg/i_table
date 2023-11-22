part of 'reservation_summary_bloc.dart';

@immutable
abstract class ReservationSummaryEvent {}

class ReservationSummaryInitiated extends ReservationSummaryEvent {
  final PlaceReservation reservation;

  ReservationSummaryInitiated({required this.reservation});
}

class ReservationSummaryCancelled extends ReservationSummaryEvent {}

class ReservationSummarySubmitted extends ReservationSummaryEvent {}


