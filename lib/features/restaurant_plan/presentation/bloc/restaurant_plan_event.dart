part of 'restaurant_plan_bloc.dart';

@immutable
abstract class RestaurantPlanEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class RestaurantPlanInitiated extends RestaurantPlanEvent{

  final String restaurantId;
  final DateTime reservationTime;

  RestaurantPlanInitiated({required this.restaurantId, required this.reservationTime});

  @override
  List<Object> get props => [restaurantId, reservationTime];
}

class RestaurantPlanElementTapped extends RestaurantPlanEvent{

  final String planElementId;

  RestaurantPlanElementTapped({required this.planElementId});

  @override
  List<Object> get props => [planElementId];
}

class RestaurantPlanReservationDateChanged extends RestaurantPlanEvent{

  final DateTime reservationDate;

  RestaurantPlanReservationDateChanged({required this.reservationDate});

  @override
  List<Object> get props => [reservationDate];
}

class RestaurantPlanReservationTimeChanged extends RestaurantPlanEvent{

  final TimeOfDay reservationTime;

  RestaurantPlanReservationTimeChanged({required this.reservationTime});

  @override
  List<Object> get props => [reservationTime];
}