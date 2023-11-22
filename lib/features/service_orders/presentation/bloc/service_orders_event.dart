part of 'service_orders_bloc.dart';

@immutable
abstract class ServiceOrdersEvent {}

class ServiceOrdersInitiated extends ServiceOrdersEvent {
  final String placeId;

  ServiceOrdersInitiated({required this.placeId});
}
