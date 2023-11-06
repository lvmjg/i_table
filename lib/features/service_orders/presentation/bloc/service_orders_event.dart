part of 'service_orders_bloc.dart';

@immutable
abstract class ServiceOrdersEvent {}

class ServiceOrdersInitiated extends ServiceOrdersEvent {
  final PlaceIdParams params;

  ServiceOrdersInitiated({required this.params});
}