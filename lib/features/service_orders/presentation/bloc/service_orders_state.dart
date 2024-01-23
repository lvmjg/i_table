part of 'service_orders_bloc.dart';

@immutable
abstract class ServiceOrdersState {}

class ServiceOrdersFetchFailure extends ServiceOrdersState {
  final ErrorParams params;

  ServiceOrdersFetchFailure({required this.params});
}

class ServiceOrdersFetchInProgress extends ServiceOrdersState {}

class ServiceOrdersFetchSuccess extends ServiceOrdersState implements SuccessState{
  final List<PlaceOrder> orders;
  late final DateTime trigger;
  final bool inTouchMode;

  ServiceOrdersFetchSuccess({required this.orders, required this.inTouchMode}) {
    trigger = DateTime.now();
  }
}

class ServiceOrderUpdateStatusFailure extends ServiceOrdersState {
  final String failure;

  ServiceOrderUpdateStatusFailure({required this.failure});
}