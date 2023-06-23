part of 'restaurant_plan_bloc.dart';

abstract class RestaurantPlanState extends Equatable {
  @override
  List<Object> get props => [];


}

class RestaurantPlanFetchFailure extends RestaurantPlanState {

}

class RestaurantPlanFetchInProgress extends RestaurantPlanState {
  RestaurantPlanFetchInProgress();
}

class RestaurantPlanFetchSuccess extends RestaurantPlanState {
  final RestaurantSetting restaurantSetting;
  final String input;

  final bool editMode;

  RestaurantPlanFetchSuccess({required this.restaurantSetting, required this.input, required this.editMode});

  @override
  List<Object> get props => [restaurantSetting, input, editMode];
}