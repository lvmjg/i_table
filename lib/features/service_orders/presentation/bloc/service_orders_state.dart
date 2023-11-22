part of 'service_orders_bloc.dart';

@immutable
abstract class ServiceOrdersState {}

class ServiceOrdersFetchFailure extends ServiceOrdersState {
  final ErrorParams params;

  ServiceOrdersFetchFailure({required this.params});
}

class ServiceOrdersFetchInProgress extends ServiceOrdersState {}

class ServiceOrdersFetchSuccess extends ServiceOrdersState {
  final List<PlaceOrder> orders;
  late final DateTime trigger;

  ServiceOrdersFetchSuccess({required this.orders}) {
    trigger = DateTime.now();
  }
}
