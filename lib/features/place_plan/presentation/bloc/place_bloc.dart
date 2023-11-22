import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/reservation_picker/presentation/bloc/reservation_picker_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entity/place_configuration_entity.dart';
import '../../domain/entity/place_reservation/place_reservation.dart';
import '../../domain/usecase/manage_place.dart';

part 'place_event.dart';

part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  late StreamSubscription<ReservationPickerState> subscription;
  ManagePlace managePlace = ManagePlace();
  PlaceConfigurationEntity? placeConf;

  PlaceBloc({required ReservationPickerBloc reservationPickerBloc})
      : super(PlaceFetchInProgress()) {
    monitorReservationPickerBloc(reservationPickerBloc);

    on<PlaceInitiated>((event, emit) async {
      emit(PlaceFetchInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      managePlace.reservationDateTime = event.reservationDateTime;
      managePlace.reservationDuration = event.reservationDuration;

      (await managePlace(PlaceIdParams(placeId: event.placeId))).fold(
          (failure) {
        emit(PlaceFetchFailure(
            placeId: event.placeId,
            reservationDateTime: event.reservationDateTime,
            reservationDuration: event.reservationDuration,
            errorMessage: errorFetchPlace));
      }, (placeConfiguration) {
        placeConf = placeConfiguration;
      });

      if (placeConf != null) {
        emit.forEach(placeConf!.placeReservationsStream!,
            onData: (List<PlaceReservation> placeReservations) {
          managePlace.analyzeReservations(placeReservations);

          return PlaceFetchSuccess(
              placeConfiguration: placeConf,
              editMode: managePlace.editMode,
              readyToReserve: managePlace.readyToReserve);
        });
      }
    });

    on<PlacePlanElementTapped>((event, emit) async {
      managePlace.elementTapped(event.planElementId);

      emit(PlaceFetchSuccess(
          placeConfiguration: placeConf,
          editMode: managePlace.editMode,
          readyToReserve: managePlace.readyToReserve));
    });

    on<PlaceReservationElementsRemoved>((event, emit) async {
      managePlace.removeElements();

      emit(PlaceFetchSuccess(
          placeConfiguration: placeConf,
          editMode: managePlace.editMode,
          readyToReserve: managePlace.readyToReserve));
    });

    on<PlaceReservationElementsAdded>((event, emit) async {
      managePlace.addElements();

      emit(PlaceFetchSuccess(
          placeConfiguration: placeConf,
          editMode: managePlace.editMode,
          readyToReserve: managePlace.readyToReserve));
    });

    on<PlaceReservationPickerChanged>((event, emit) async {
      managePlace.reservationPickerChanged(
          event.reservationDateTime, event.reservationDuration);

      if (placeConf != null) {
        emit(PlaceFetchSuccess(
            placeConfiguration: placeConf,
            editMode: managePlace.editMode,
            readyToReserve: managePlace.readyToReserve));
      }
    });

    on<PlaceDisposed>((event, emit) async {
      managePlace.dispose();
    });
  }

  void monitorReservationPickerBloc(
      ReservationPickerBloc reservationPickerBloc) {
    subscription = reservationPickerBloc.stream.listen((state) {
      if (state is ReservationPickerChange) {
        this.add(PlaceReservationPickerChanged(
            reservationDateTime: state.data.reservationDateTime,
            reservationDuration: state.data.reservationDuration));
      }
    });
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
