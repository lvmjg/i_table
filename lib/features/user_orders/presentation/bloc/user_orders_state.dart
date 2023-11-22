part of 'user_orders_bloc.dart';

@immutable
abstract class UserOrdersState {}

class UserOrdersFetchFailure extends UserOrdersState {
  final ErrorParams params;

  UserOrdersFetchFailure({required this.params});
}

class UserOrdersFetchInProgress extends UserOrdersState {}

class UserOrdersFetchSuccess extends UserOrdersState {
  final List<PlaceOrder> orders;
  late final DateTime trigger;

  UserOrdersFetchSuccess({required this.orders}){
    trigger = DateTime.now();
  }
}