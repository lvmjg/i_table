part of 'user_orders_bloc.dart';

@immutable
abstract class UserOrdersState {}

class UserOrdersFetchFailure extends UserOrdersState {
  final String errorMessage;

  UserOrdersFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class UserOrdersFetchInProgress extends UserOrdersState {
  UserOrdersFetchInProgress();
}

class UserOrdersFetchSuccess extends UserOrdersState {
  final List<PlaceOrder> orders;
  late final DateTime trigger;

  UserOrdersFetchSuccess({required this.orders}){
    trigger = DateTime.now();
  }

  @override
  List<Object> get props => [trigger, orders];
}