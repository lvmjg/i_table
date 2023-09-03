part of 'user_reservations_bloc.dart';

@immutable
abstract class UserReservationsState {}

class UserReservationsFetchFailure extends UserReservationsState {
  final String errorMessage;

  UserReservationsFetchFailure({required this.errorMessage});
}

class UserReservationsFetchInProgress extends UserReservationsState {
  UserReservationsFetchInProgress();
}

class UserReservationsFetchSuccess extends UserReservationsState {
  final List<PlaceReservation> userReservations;

  UserReservationsFetchSuccess({required this.userReservations});
}
