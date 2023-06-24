import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/restaurant_plan/restaurant_setting.dart';
import '../../domain/usecases/restaurant_plan_usecase.dart';

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
          emit(RestaurantPlanFetchSuccess(restaurantSetting: restaurantSetting!, input: '', editMode: restaurantPlanUseCase.editMode));
        }
    });

    on<RestaurantPlanElementTapped>((event, emit) async {
      restaurantPlanUseCase.elementTapped(event.planElementId);

      Random r  = Random();
      emit(RestaurantPlanFetchSuccess(restaurantSetting: restaurantSetting!, input:r.nextDouble().toString(), editMode: restaurantPlanUseCase.editMode));
    });

    on<RestaurantPlanReservationDateChanged>((event, emit) async {
      restaurantPlanUseCase.reservationDateChanged(event.reservationDate);

      Random r  = Random();
      emit(RestaurantPlanFetchSuccess(restaurantSetting: restaurantSetting!, input:r.nextDouble().toString(), editMode: restaurantPlanUseCase.editMode));
    });

    on<RestaurantPlanReservationTimeChanged>((event, emit) async {
      restaurantPlanUseCase.reservationTimeChanged(event.reservationTime);

      Random r  = Random();
      emit(RestaurantPlanFetchSuccess(restaurantSetting: restaurantSetting!, input:r.nextDouble().toString(), editMode: restaurantPlanUseCase.editMode));
    });
  }


}
