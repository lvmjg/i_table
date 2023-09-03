import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/src/material/time.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/core/util/string_util.dart';
import '../../../../core/util/globals.dart';
import '../../../place_entry/data/models/place_settings/place_settings_model.dart';
import '../../../place_entry/domain/entities/place_settings.dart';
import '../../../place_entry/domain/entities/place_settings_factory.dart';
import '../../data/datasources/place_plan_remote_data_source.dart';
import '../../data/datasources/place_reservations_remote_data_source.dart';
import '../../../place_entry/data/datasources/place_settings_remote_data_source.dart';
import '../../data/repositories/place_plan_repository.dart';
import '../../data/repositories/place_reservations_repository.dart';
import '../../../place_entry/data/repositories/place_settings_repository.dart';
import '../entities/place_configuration_entity.dart';
import '../entities/place_plan/plan_elements_factory.dart';
import '../entities/place_plan/plan_elements_group.dart';
import '../entities/place_plan/plan_level.dart';
import '../entities/place_plan/plan_state.dart';
import '../entities/place_reservation/place_reservation.dart';
import '../entities/place_reservation/place_reservations_factory.dart';

class ManagePlace implements UseCase<PlaceConfigurationEntity, PlaceIdParams> {
  final PlaceSettingsRepositoryImpl placeSettingsRepository =
      PlaceSettingsRepositoryImpl(PlaceSettingsRemoteDataSourceImpl(), PlaceSettingsFactory());
  final PlacePlanRepositoryImpl placePlanRepository =
      PlacePlanRepositoryImpl(PlacePlanRemoteDataSourceImpl(), PlanElementsFactory());
  final PlaceReservationsRepositoryImpl placeReservationsRepository =
      PlaceReservationsRepositoryImpl(PlaceReservationsRemoteDataSourceImpl(), PlaceReservationsFactory());

  PlaceSettingsModel? placeSettings;
  List<PlanLevel> placePlanLevels = [];
  List<PlaceReservation> placeReservations = [];


  Map<String, PlanElementsGroup> planElements = {};
  List<PlaceReservation> filteredReservations = [];

  late DateTime startDate;
  late TimeOfDay startTime;
  late DateTime startDateTime;

  String editingGroup = StringUtil.EMPTY;
  bool editMode = false;

  ManagePlace(){
    startDate = DateTime.now();
    startTime = TimeOfDay.now();
  }

  bool get readyToReserve => planElements.values.any((elementGroup) => elementGroup.state == PlanState.potentiallyReserved);

  @override
  Future<Either<Failure, PlaceConfigurationEntity>> call(
      PlaceIdParams params) async {
    Either<Failure, PlaceSettings> settingsEither =
        await placeSettingsRepository.fetchPlaceSettings(params.placeId);

    settingsEither.fold((failure) {
      return Left(failure);
    }, (settingsEither) {
      settingsEither = settingsEither;
    });

    Either<Failure, List<PlanLevel>> planEither =
        await placePlanRepository.fetchPlacePlan(params.placeId);
    if (planEither.isRight()) {
      placePlanLevels = planEither.getOrElse(() => []);
    } else {
      return Left(FetchFailure());
    }

    listenToReservationsStream(params.placeId);

    if(placePlanLevels.isNotEmpty){
      planElements = placePlanLevels.first.placePlanElements;
    }

    return Right(PlaceConfigurationEntity(placeSettings, placePlanLevels));
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

  void reservationDateChanged(DateTime reservationDate) {
    startDate = reservationDate;
    startDateTime = DateTime(startDate.year, startDate.month, startDate.day, startTime.hour, startTime.minute);

    analyzeReservations();
  }

  void reservationTimeChanged(TimeOfDay reservationTime) {
    startTime = reservationTime;
    startDateTime = DateTime(startDate.year, startDate.month, startDate.day, startTime.hour, startTime.minute);

    analyzeReservations();
  }

  void analyzeReservations(){
    planElements.values.where((elementGroup) => elementGroup.isReserved).forEach((elementGroup) {
      elementGroup.unreserve(elementGroup.id);
    });

    startDateTime = startDate.add(Duration(hours: startTime.hour, minutes: startTime.minute));
    filteredReservations = placeReservations.where((element) =>
    (startDateTime.isAtSameMomentAs(element.startDate) || startDateTime.isAfter(element.startDate) )
        &&
        (startDateTime.isAtSameMomentAs(element.endDate) || startDateTime.isBefore(element.endDate))
    ).toList();

    filteredReservations.forEach((reservation) {

      if(reservation.tables.isNotEmpty){
        reservation.tables.forEach((id, table) {
          PlanElementsGroup? elementsGroup = placePlanLevels.first.placePlanElements[id];
          if(elementsGroup != null){
            elementsGroup.validateAgainstReservation(reservation);
          }
          else{
            //error
          }
        });
      }

      if(reservation.groups.isNotEmpty){
        reservation.groups.forEach((id, value) {
          PlanElementsGroup? elementsGroup = placePlanLevels.first.placePlanElements[id];
          if(elementsGroup != null){
            elementsGroup.validateAgainstReservation(reservation);
          }
          else{
            //error
          }
        });
      }

      if(reservation.sittings.isNotEmpty){
        reservation.sittings.forEach((sitting) {
          PlanElementsGroup? elementsGroup = placePlanLevels.first.placePlanElements[sitting];
          if(elementsGroup != null){
            elementsGroup.validateAgainstReservation(reservation);
          }
          else{
            //error
          }
        });
      }

    });
  }

  String formatTracked() {
    /*   StringBuffer stringBuffer = StringBuffer();

    List<PlacePlanElementEntity> tables = trackedElements.where((element) => element.type=='T').toList();
    tables.forEach((element) {
      stringBuffer.write('Stolik: ${element.name} (Miejsca: ');

      List<PlacePlanElementEntity> sittings = findTableSittings(element as PlacePlanTableModel);


      sittings.forEach((element){
        if(element.selected) {
          stringBuffer.write('${element.name} ');
        }
      });

      stringBuffer.write(')\n');
    });

    stringBuffer.write('Miejsca: ');

    List<PlacePlanElementEntity> sittingGroups = trackedElements.where((element) => element.type=='S').toList();
    sittingGroups.forEach((element) {
      PlacePlanSittingEntity sitting = element as PlacePlanSittingEntity;
      if(element.table == false && element.selected) {
        stringBuffer.write('${sitting.name} ');
      }
    });

    return stringBuffer.toString();*/
    return StringUtil.EMPTY;
  }

  void requestReservation() {
    Map<String, dynamic> tables = {};
    Map<String, dynamic> sittingGroups = {};
    List<String> sittings = [];

    planElements.values.forEach((element) {
      Map<String, dynamic> map = element.getInReservationFormat();
      if (map.isNotEmpty) {
        if (element.getGroupType() == PlanElementsGroupType.table) {
          tables.addAll(map);
        } else if (element.getGroupType() == PlanElementsGroupType.sittingGroup) {
          sittingGroups.addAll(map);
        } else if (element.getGroupType() == PlanElementsGroupType.sitting) {
          sittings.add(map['id']);
        }
      }
    });

    Map<String, dynamic> reservedElements = {};
    if(tables.isNotEmpty){
      reservedElements['tables'] = tables;
    }
    if(sittingGroups.isNotEmpty){
      reservedElements['groups'] = sittingGroups;
    }
    if(sittings.isNotEmpty){
      reservedElements['sittings'] = sittings;
    }

    reservedElements['placeId']='9wtiLFlRdZ1b8abbPoet';
    reservedElements['placeName']='147 Nowogrodzka';
    reservedElements['userId'] = loggedUserId;
    reservedElements['status'] = 'Opened';
    reservedElements['people'] = 10;
    reservedElements['startDate'] = DateTime.now();
    reservedElements['duration'] = 1000;


    FirebaseFirestore ff = FirebaseFirestore.instance;
    ff.collection(pathPlacesReservations).add(reservedElements);
  }

  StreamSubscription<List<PlaceReservation>>? placeReservationsSubscription;

  void listenToReservationsStream(String placeId) async {
    Either<Failure, Stream<List<PlaceReservation>>> reservationsEither =
        await placeReservationsRepository.fetchPlaceReservations(
        placeId, startDate);

    if (reservationsEither.isRight()) {
      Stream<List<PlaceReservation>> placeReservationsStream = reservationsEither.getOrElse(() => Stream.empty());

      placeReservationsSubscription = placeReservationsStream.listen((event) {
        placeReservations.addAll(event);
        analyzeReservations();
      });
    }
  }

  void dispose(){
    if(placeReservationsSubscription!=null){
      placeReservationsSubscription!.cancel();
    }
  }
}
