import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../place_details/domain/usecase/fetch_place_details.dart';
import '../../domain/entities/place_configuration_entity.dart';
import '../../domain/usecases/manage_place.dart';

part 'place_event.dart';

part 'place_state.dart';

class PlaceBloc
    extends Bloc<PlaceEvent, PlaceState> {
  PlaceBloc() : super(PlaceFetchInProgress()) {
    ManagePlace managePlace = ManagePlace();

    PlaceConfigurationEntity? placeConfiguration;

    on<PlaceInitiated>((event, emit) async {
      emit(PlaceFetchInProgress());

      if (state is PlaceFetchInProgress) {
        PlaceConfigurationEntity? placeConfiguration = null;
        (await managePlace(PlaceIdParams(placeId: event.placeId)))
            .fold((failure) {

        },
                (placeConfiguration) {
                emit(PlaceFetchSuccess(
                placeConfiguration: placeConfiguration!,
                input: '',
                editMode: managePlace.editMode));
            });


      }
    });

    on<PlacePlanElementTapped>((event, emit) async {
      managePlace.elementTapped(event.planElementId);

      bool eddit = managePlace.editMode;
      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConfiguration!,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode));
    });

    on<PlaceReservationDateChanged>((event, emit) async {
      managePlace.reservationDateChanged(event.reservationDate);

      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConfiguration!,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode));
    });

    on<PlaceReservationTimeChanged>((event, emit) async {
      managePlace.reservationTimeChanged(event.reservationTime);

      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConfiguration!,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode));
    });

    on<PlaceEditModeCancelled>((event, emit) async {
      managePlace.editModeCancelled();

      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConfiguration!,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode));
    });
  }
}
