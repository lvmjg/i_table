import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'restaurant_plan_event.dart';
part 'restaurant_plan_state.dart';

class RestaurantPlanBloc extends Bloc<RestaurantPlanEvent, RestaurantPlanState> {
  RestaurantPlanBloc() : super(RestaurantPlanInitial()) {
    on<RestaurantPlanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
