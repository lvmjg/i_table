part of 'service_orders_bloc.dart';

@immutable
abstract class ServiceOrdersState {}

class ServiceOrdersFetchFailure extends ServiceOrdersState {
  final String errorMessage;

  ServiceOrdersFetchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ServiceOrdersFetchInProgress extends ServiceOrdersState {
  ServiceOrdersFetchInProgress();
}

class ServiceOrdersFetchSuccess extends ServiceOrdersState {
  final List<PlaceOrder> orders;
  late final DateTime trigger;

  ServiceOrdersFetchSuccess({required this.orders}){
    trigger = DateTime.now();
  }

  @override
  List<Object> get props => [trigger, orders];
}