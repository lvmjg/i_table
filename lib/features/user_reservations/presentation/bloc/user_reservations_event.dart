part of 'user_reservations_bloc.dart';

@immutable
abstract class UserReservationsEvent {}

class UserReservationsInitiated extends UserReservationsEvent {
  final String userId;

  UserReservationsInitiated({required this.userId});
}
