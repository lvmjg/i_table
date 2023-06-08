part of 'restaurant_details_bloc.dart';

@immutable
abstract class RestaurantDetailsEvent extends Equatable{

  @override
  List<Object> get props => [];
}


class RestaurantDetailsInit extends RestaurantDetailsEvent{

  final String restaurantId;

  RestaurantDetailsInit({required this.restaurantId});

  @override
  List<Object> get props => [];
}

