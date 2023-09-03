import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_table/features/place_search/presentation/bloc/place_search_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../place_search/data/models/place_search_model.dart';
import '../../domain/entities/place_configuration_entity.dart';
import '../../domain/usecases/manage_place.dart';

part 'place_event.dart';

part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  late StreamSubscription<PlaceSearchState> placeSearchSubscription;
  late PlaceSearchModel place;

  PlaceBloc() : super(PlaceFetchInProgress()) {
  //  monitorSelectedPlace(placeSearchBloc);

    ManagePlace managePlace = ManagePlace();

    PlaceConfigurationEntity? placeConf;

    on<PlaceInitiated>((event, emit) async {
      emit(PlaceFetchInProgress());

      if (state is PlaceFetchInProgress) {
        (await managePlace(PlaceIdParams(placeId: event.placeId)))
            .fold((failure) {}, (placeConfiguration) {
          placeConf = placeConfiguration;
          emit(PlaceFetchSuccess(
              placeConfiguration: placeConfiguration,
              input: '',
              editMode: managePlace.editMode,
              formatTracked: managePlace.formatTracked(), readyToReserve: managePlace.readyToReserve));
        });
      }
    });

    on<PlaceReservationDateChanged>((event, emit) async {
      managePlace.reservationDateChanged(event.reservationDate);

      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConf,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode,
          formatTracked: managePlace.formatTracked(), readyToReserve: managePlace.readyToReserve));
    });

    on<PlaceReservationTimeChanged>((event, emit) async {
      managePlace.reservationTimeChanged(event.reservationTime);

      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConf,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode,
          formatTracked: managePlace.formatTracked(), readyToReserve: managePlace.readyToReserve));
    });

    on<PlacePlanElementTapped>((event, emit) async {
      managePlace.elementTapped(event.planElementId);

      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConf,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode,
          formatTracked: managePlace.formatTracked(), readyToReserve: managePlace.readyToReserve));
    });

    on<PlaceReservationElementsRemoved>((event, emit) async {
      managePlace.removeElements();

      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConf,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode,
          formatTracked: managePlace.formatTracked(), readyToReserve: managePlace.readyToReserve));
    });

    on<PlaceReservationElementsAdded>((event, emit) async {
      managePlace.addElements();

      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConf,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode,
          formatTracked: managePlace.formatTracked(), readyToReserve: managePlace.readyToReserve));
    });

    on<PlaceReservationRequest>((event, emit) async {
      managePlace.requestReservation();

      Random r = Random();
      emit(PlaceFetchSuccess(
          placeConfiguration: placeConf,
          input: r.nextDouble().toString(),
          editMode: managePlace.editMode,
          formatTracked: managePlace.formatTracked(), readyToReserve: managePlace.readyToReserve));
    });


    on<PlaceDisposed>((event, emit) async {
      managePlace.dispose();
    });
  }
/*
  void monitorSelectedPlace(PlaceSearchBloc placeSearchBloc) {
    placeSearchSubscription = placeSearchBloc.stream.listen((state) {
      if (state is PlaceSearchResultSelect) {
        place = state.place;
      }
    });
  }

  @override
  Future<void> close() {
    placeSearchSubscription.cancel();
    return super.close();
  }*/
}
