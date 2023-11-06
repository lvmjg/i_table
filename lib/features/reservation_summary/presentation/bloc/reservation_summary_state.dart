part of 'reservation_summary_bloc.dart';

@immutable
abstract class ReservationSummaryState {}

class ReservationSummaryInitial extends ReservationSummaryState {
  final PlaceReservation placeReservation;

  ReservationSummaryInitial({required this.placeReservation});
}

class ReservationSummaryCancel extends ReservationSummaryState {}

class ReservationSummarySubmitFailure extends ReservationSummaryState {
  final String errorMessage;

  ReservationSummarySubmitFailure({required this.errorMessage});
}

class ReservationSummarySubmitInProgress extends ReservationSummaryState {}

class ReservationSummarySubmitSuccess extends ReservationSummaryState {}
