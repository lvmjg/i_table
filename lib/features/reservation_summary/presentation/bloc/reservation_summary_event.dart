part of 'reservation_summary_bloc.dart';

@immutable
abstract class ReservationSummaryEvent {}

class ReservationSummaryInitiated extends ReservationSummaryEvent{
  final PlaceReservation placeReservation;

  ReservationSummaryInitiated({required this.placeReservation});
}

class ReservationSummaryCancelled extends ReservationSummaryEvent{}

class ReservationSummarySubmitted extends ReservationSummaryEvent{}


