import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:i_table/features/restaurant_plan/domain/usecases/manage_restaurant.dart';
import 'package:meta/meta.dart';

import '../../../restaurant_details/domain/usecase/fetch_restaurant_details.dart';
import '../../../restaurant_details/presentation/bloc/restaurant_details_bloc.dart';
import '../../domain/entities/restaurant_plan/restaurant_setting.dart';

part 'restaurant_plan_event.dart';

part 'restaurant_plan_state.dart';

class RestaurantPlanBloc
    extends Bloc<RestaurantPlanEvent, RestaurantPlanState> {
  RestaurantPlanBloc() : super(RestaurantPlanFetchInProgress()) {
    ManageRestaurant manageRestaurant = ManageRestaurant();

    RestaurantSetting? restaurantSetting;

    on<RestaurantPlanInitiated>((event, emit) async {
      emit(RestaurantPlanFetchInProgress());

      if (state is RestaurantPlanFetchInProgress) {
        RestaurantSetting? restaurantSetting = null;
        (await manageRestaurant(RestaurantIdParams(restaurantId: event.restaurantId)))
            .fold((failure) {

        },
                (restaurantSetting) {
                emit(RestaurantPlanFetchSuccess(
                restaurantSetting: restaurantSetting!,
                input: '',
                editMode: manageRestaurant.editMode));
            });


      }
    });

    on<RestaurantPlanElementTapped>((event, emit) async {
      manageRestaurant.elementTapped(event.planElementId);

      bool eddit = manageRestaurant.editMode;
      Random r = Random();
      emit(RestaurantPlanFetchSuccess(
          restaurantSetting: restaurantSetting!,
          input: r.nextDouble().toString(),
          editMode: manageRestaurant.editMode));
    });

    on<RestaurantPlanReservationDateChanged>((event, emit) async {
      manageRestaurant.reservationDateChanged(event.reservationDate);

      Random r = Random();
      emit(RestaurantPlanFetchSuccess(
          restaurantSetting: restaurantSetting!,
          input: r.nextDouble().toString(),
          editMode: manageRestaurant.editMode));
    });

    on<RestaurantPlanReservationTimeChanged>((event, emit) async {
      manageRestaurant.reservationTimeChanged(event.reservationTime);

      Random r = Random();
      emit(RestaurantPlanFetchSuccess(
          restaurantSetting: restaurantSetting!,
          input: r.nextDouble().toString(),
          editMode: manageRestaurant.editMode));
    });

    on<RestaurantPlanEditModeCancelled>((event, emit) async {
      manageRestaurant.editModeCancelled();

      Random r = Random();
      emit(RestaurantPlanFetchSuccess(
          restaurantSetting: restaurantSetting!,
          input: r.nextDouble().toString(),
          editMode: manageRestaurant.editMode));
    });
  }
}
