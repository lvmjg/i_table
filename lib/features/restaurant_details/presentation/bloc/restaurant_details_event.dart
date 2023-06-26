part of 'restaurant_details_bloc.dart';

@immutable
abstract class RestaurantDetailsEvent extends Equatable{

  @override
  List<Object> get props => [];
}


class RestaurantDetailsInitiated extends RestaurantDetailsEvent{

  final String restaurantId;

  RestaurantDetailsInitiated({required this.restaurantId});

  @override
  List<Object> get props => [];
}

