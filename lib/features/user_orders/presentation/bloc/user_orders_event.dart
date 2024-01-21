part of 'user_orders_bloc.dart';

@immutable
abstract class UserOrdersEvent {}

class UserOrdersInitiated extends UserOrdersEvent {
  final String userOrReservationId;

  UserOrdersInitiated({required this.userOrReservationId});
}
