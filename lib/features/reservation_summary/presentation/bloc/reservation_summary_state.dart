part of 'reservation_summary_bloc.dart';

@immutable
abstract class ReservationSummaryState {}

class ReservationSummaryInitial extends ReservationSummaryState {
  final PlaceReservation reservation;

  ReservationSummaryInitial({required this.reservation});
}

class ReservationSummaryCancel extends ReservationSummaryState {}

class ReservationSummarySubmitFailure extends ReservationSummaryState {
  final ErrorParams params;

  ReservationSummarySubmitFailure({required this.params});
}

class ReservationSummarySubmitInProgress extends ReservationSummaryState {}

class ReservationSummarySubmitSuccess extends ReservationSummaryState {}
