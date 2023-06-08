part of 'restaurant_details_bloc.dart';

abstract class RestaurantDetailsState extends Equatable {

  @override
  List<Object?> get props => [];
}


class RestaurantDetailsFetchFailure extends RestaurantDetailsState {


}

class RestaurantDetailsFetchInProgress extends RestaurantDetailsState {
  RestaurantDetailsFetchInProgress();

}

class RestaurantDetailsFetchSuccess extends RestaurantDetailsState {
  final RestaurantDetailsEntity restaurantDetails;

  RestaurantDetailsFetchSuccess({required this.restaurantDetails});

  @override
  List<Object> get props => [restaurantDetails];
}