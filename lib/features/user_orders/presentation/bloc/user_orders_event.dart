part of 'user_orders_bloc.dart';

@immutable
abstract class UserOrdersEvent {}

class UserOrdersInitiated extends UserOrdersEvent {
  final UserOrdersParams params;

  UserOrdersInitiated({required this.params});
}