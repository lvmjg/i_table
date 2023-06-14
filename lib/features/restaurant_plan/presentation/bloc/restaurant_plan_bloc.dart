import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_table/features/restaurant_plan/domain/usecase/restaurant_plan_usecase.dart';
import 'package:meta/meta.dart';

import '../../../restaurant_details/presentation/bloc/restaurant_details_bloc.dart';
import '../../domain/entity/restaurant_plan/restaurant_plan_element_entity.dart';
import '../../domain/entity/restaurant_plan/restaurant_setting.dart';

part 'restaurant_plan_event.dart';
part 'restaurant_plan_state.dart';

class RestaurantPlanBloc extends Bloc<RestaurantPlanEvent, RestaurantPlanState> {
  RestaurantPlanBloc() : super(RestaurantPlanFetchInProgress()) {
    RestaurantPlanUseCase restaurantPlanUseCase = RestaurantPlanUseCase();

    RestaurantSetting? restaurantSetting;

    on<RestaurantPlanInitiated>((event, emit) async {
        emit(RestaurantPlanFetchInProgress());

        restaurantSetting = await restaurantPlanUseCase.fetchRestaurantSetting(event.restaurantId);

        if (state is RestaurantPlanFetchInProgress) {
          emit(RestaurantPlanFetchSuccess(restaurantSetting: restaurantSetting!, input: ''));
        }
    });
    });
  }
}
