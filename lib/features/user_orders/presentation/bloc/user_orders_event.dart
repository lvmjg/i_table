part of 'user_orders_bloc.dart';

@immutable
abstract class UserOrdersEvent {}

class UserOrdersInitiated extends UserOrdersEvent {
  final String userId;
  final String reservationId;

  UserOrdersInitiated({required this.userId, required this.reservationId});
}
