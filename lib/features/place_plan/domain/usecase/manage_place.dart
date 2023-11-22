import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/extension/extension.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/core/util/string_util.dart';
import '../../../../core/util/globals.dart';
import '../../../place_entry/data/data_source/place_settings_remote_data_source.dart';
import '../../../place_entry/data/model/place_settings/place_settings_model.dart';
import '../../../place_entry/data/repository/place_settings_repository.dart';
import '../../../place_entry/domain/entity/place_settings.dart';
import '../../../place_entry/domain/entity/place_settings_factory.dart';
import '../../data/data_source/place_plan_remote_data_source.dart';
import '../../data/data_source/place_reservations_remote_data_source.dart';
import '../../data/repository/place_plan_repository.dart';
import '../../data/repository/place_reservations_repository.dart';
import '../entity/place_configuration_entity.dart';
import '../entity/place_plan/plan_elements_factory.dart';
import '../entity/place_plan/plan_elements_group.dart';
import '../entity/place_plan/plan_level.dart';
import '../entity/place_plan/plan_state.dart';
import '../entity/place_reservation/place_reservation.dart';
import '../entity/place_reservation/place_reservations_factory.dart';

class ManagePlace implements UseCase<PlaceConfigurationEntity, PlaceIdParams> {
  final PlaceSettingsRepositoryImpl placeSettingsRepository =
      PlaceSettingsRepositoryImpl(
          PlaceSettingsRemoteDataSourceImpl(), PlaceSettingsFactory());
  final PlacePlanRepositoryImpl placePlanRepository = PlacePlanRepositoryImpl(
      PlacePlanRemoteDataSourceImpl(), PlanElementsFactory());
  final PlaceReservationsRepositoryImpl placeReservationsRepository =
      PlaceReservationsRepositoryImpl(
          PlaceReservationsRemoteDataSourceImpl(), PlaceReservationsFactory());

  PlaceSettings? placeSettings;
  List<PlanLevel> placePlanLevels = [];
  Stream<List<PlaceReservation>>? placeReservationsStream;

  List<PlaceReservation> placeReservations = [];

  Map<String, PlanElementsGroup> planElements = {};
  List<PlaceReservation> filteredReservations = [];

  late DateTime reservationDateTime;
  late Duration reservationDuration;

  String editingGroup = StringUtil.EMPTY;
  bool editMode = false;

  bool get readyToReserve => planElements.values.any(
      (elementGroup) => elementGroup.state == PlanState.potentiallyReserved);

  @override
  Future<Either<Failure, PlaceConfigurationEntity>> call(
      PlaceIdParams params) async {
    Either<Failure, PlaceSettings> settingsEither =
        await placeSettingsRepository.fetchPlaceSettings(params.placeId);

    settingsEither.fold((failure) => Left(FetchFailure()),
        (newPlaceSettings) => placeSettings = newPlaceSettings);

    Either<Failure, List<PlanLevel>> planEither =
        await placePlanRepository.fetchPlacePlan(params.placeId);

    if (planEither.isRight()) {
      placePlanLevels = planEither.getOrElse(() => []);
    } else {
      return Left(FetchFailure());
    }

    Either<Failure, Stream<List<PlaceReservation>>> reservationsEither =
        placeReservationsRepository.fetchPlaceReservations(
            params.placeId, reservationDateTime);

    reservationsEither.fold(
        (failure) => Left(FetchFailure()),
        (newPlaceReservationsStream) =>
            placeReservationsStream = newPlaceReservationsStream);

    if (placePlanLevels.isNotEmpty) {
      planElements = placePlanLevels.first.placePlanElements;
    }

    return Right(PlaceConfigurationEntity(
        placeSettings, placePlanLevels, placeReservationsStream!));
  }

  void elementTapped(String planElementId) {
    editingGroup = planElementId;

    List<PlanElementsGroup> tappedGroups = planElements.values
        .where((group) => group.containsElement(planElementId))
        .toList();

    if (tappedGroups.isNotEmpty) {
      tappedGroups.first.tap(planElementId);

      if (tappedGroups.first.isEdited(planElementId)) {
        editMode = true;
      } else {
        editMode = false;
      }
    }
  }

  void removeElements() {
    List<PlanElementsGroup> tappedGroups = planElements.values
        .where((group) => group.containsElement(editingGroup))
        .toList();

    if (tappedGroups.isNotEmpty) {
      tappedGroups.first.unreserve(editingGroup);
    }

    editMode = false;
  }

  void addElements() {
    List<PlanElementsGroup> tappedGroups = planElements.values
        .where((group) => group.containsElement(editingGroup))
        .toList();

    if (tappedGroups.isNotEmpty) {
      tappedGroups.first.potentiallyReserve(editingGroup);
    }

    editMode = false;
  }

  void reservationPickerChanged(
      DateTime reservationDateTime, Duration reservationDuration) {
    this.reservationDateTime = reservationDateTime;
    this.reservationDuration = reservationDuration;
    if (placePlanLevels.isNotEmpty) {
      analyzeReservations(placeReservations);
    }
  }

  void analyzeReservations(List<PlaceReservation> newPlaceReservations) {
    placeReservations = newPlaceReservations;

    planElements.values
        .where((elementGroup) => elementGroup.state == PlanState.reserved)
        .forEach((elementGroup) {
      elementGroup.unreserve(elementGroup.id);
    });

    //settiing -> restricted unrestricted
    //overlapping
    filteredReservations = placeReservations.where((placeReservation) {
      DateTime reservationStart = placeReservation.startDate;
      DateTime reservationEnd = placeReservation.startDate
          .add(Duration(minutes: placeReservation.duration));
      DateTimeRange reservationRange =
          DateTimeRange(start: reservationStart, end: reservationEnd);

      DateTime userReservationStart = reservationDateTime;
      DateTime userReservationEnd =
          reservationDateTime.add(reservationDuration);
      DateTimeRange userReservationRange =
          DateTimeRange(start: userReservationStart, end: userReservationEnd);

      //Time restricted reserv can be in unrestrictedMode, but not vice versa
      bool alreadyReserved;
      //timeUnrestrictedReservation
      if (reservationEnd.isAtSameMomentAs(reservationStart)) {
        alreadyReserved = reservationStart.isBefore(userReservationEnd);
        if (alreadyReserved == false) {
          bool reservationAhead = reservationStart.isAfter(userReservationEnd);
          if (reservationAhead) {
            //Duration timeGap = DateTimeRange(start: userReservationEnd, end: reservationStart).duration;
            //if(timeGap < lon)
          }
        }
      }
      //timeRestrictedReservation
      else {
        bool modeUnrestricted = false;
        if (modeUnrestricted) {
          alreadyReserved = reservationEnd.isAfter(userReservationStart);
        } else {
          alreadyReserved = userReservationRange.overlapWith(reservationRange);
        }
      }

      return alreadyReserved;
    }).toList();

    filteredReservations.forEach((reservation) {
      if (reservation.tables.isNotEmpty) {
        reservation.tables.forEach((id, table) {
          PlanElementsGroup? elementsGroup =
              placePlanLevels.first.placePlanElements[id];
          if (elementsGroup != null) {
            elementsGroup.validateAgainstReservation(reservation);
          } else {
            //error
          }
        });
      }

      if (reservation.groups.isNotEmpty) {
        reservation.groups.forEach((id, value) {
          PlanElementsGroup? elementsGroup =
              placePlanLevels.first.placePlanElements[id];
          if (elementsGroup != null) {
            elementsGroup.validateAgainstReservation(reservation);
          } else {
            //error
          }
        });
      }

      if (reservation.sittings.isNotEmpty) {
        reservation.sittings.forEach((sitting) {
          PlanElementsGroup? elementsGroup =
              placePlanLevels.first.placePlanElements[sitting];
          if (elementsGroup != null) {
            elementsGroup.validateAgainstReservation(reservation);
          } else {
            //error
          }
        });
      }
    });
  }

  PlaceReservation get requestedReservation {
    Map<String, Map<String, List<String>>> tables = {};
    Map<String, List<String>> sittingGroups = {};
    List<String> sittings = [];

    planElements.values.forEach((element) {
      Map<String, dynamic> map = element.getInReservationFormat();
      if (map.isNotEmpty) {
        if (element.getGroupType() == PlanElementsGroupType.table) {
          tables.addAll(map.cast());
        } else if (element.getGroupType() ==
            PlanElementsGroupType.sittingGroup) {
          sittingGroups.addAll(map.cast());
        } else if (element.getGroupType() == PlanElementsGroupType.sitting) {
          sittings.add(map['id']);
        }
      }
    });

    return PlaceReservation(
        no: StringUtil.EMPTY,
        placeId: '9wtiLFlRdZ1b8abbPoet',
        placeName: '147 Break',
        placeAddress: 'Nowogrodzka 84/86, Warszawa',
        userId: loggedUserId,
        startDate: reservationDateTime,
        endDate: reservationDateTime
            .add(Duration(minutes: reservationDuration.inMinutes)),
        duration: reservationDuration.inMinutes,
        people: 4,
        status: 'new',
        tables: tables,
        groups: sittingGroups,
        sittings: sittings);
  }

  void dispose() {}
}
