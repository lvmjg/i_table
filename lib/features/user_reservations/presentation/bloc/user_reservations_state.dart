part of 'user_reservations_bloc.dart';

@immutable
abstract class UserReservationsState {}

class UserReservationsFetchFailure extends UserReservationsState {
  final ErrorParams params;

  UserReservationsFetchFailure({required this.params});
}

class UserReservationsFetchInProgress extends UserReservationsState {}

class UserReservationsFetchSuccess extends UserReservationsState implements SuccessState {
  final List<PlaceReservation> reservations;

  UserReservationsFetchSuccess({required this.reservations});
}
