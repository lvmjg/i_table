import 'package:dartz/dartz.dart';
import 'package:flutter/src/material/time.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../place_details/domain/usecase/fetch_place_details.dart';
import '../../data/datasources/place_plan_remote_data_source.dart';
import '../../data/datasources/place_reservations_remote_data_source.dart';
import '../../data/datasources/place_settings_remote_data_source.dart';
import '../../data/repositories/place_plan_repository.dart';
import '../../data/repositories/place_reservations_repository.dart';
import '../../data/repositories/place_settings_repository.dart';
import '../entities/place_configuration_entity.dart';
import '../entities/place_plan/place_plan_element_entity.dart';
import '../entities/place_plan/place_plan_level_entity.dart';
import '../entities/place_reservation/place_reservation_entity.dart';
import '../entities/place_settings/place_settings_entity.dart';

class ManagePlace
    implements UseCase<PlaceConfigurationEntity, PlaceIdParams> {
  final PlaceSettingsRepositoryImpl
      placeSettingsRepository = PlaceSettingsRepositoryImpl(
          PlaceSettingsRemoteDataSourceImpl());
  final PlacePlanRepositoryImpl placePlanRepository =
      PlacePlanRepositoryImpl(PlacePlanRemoteDataSourceImpl());
  final PlaceReservationsRepositoryImpl placeReservationsRepository =
      PlaceReservationsRepositoryImpl(
          PlaceReservationsRemoteDataSourceImpl());

  PlaceSettingsEntity? placeSettings;
  List<PlacePlanLevelEntity> placePlanLevels = [];
  List<PlaceReservationEntity> placeReservations = [];

  DateTime? reservationDate;
  TimeOfDay? reservationTime;

  bool editMode = false;
  List<PlacePlanElementEntity> selectedElements = [];
  List<PlacePlanElementEntity> highlightedElements = [];

  @override
  Future<Either<Failure, PlaceConfigurationEntity>> call(
      PlaceIdParams params) async {
    Either<Failure, PlaceSettingsEntity?> settingsEither =
        await placeSettingsRepository
            .fetchPlaceSettings(params.placeId);

    settingsEither.fold((failure) {
      return Left(failure);
    }, (settingsEither) {
      settingsEither = settingsEither;
    });

    Either<Failure, List<PlacePlanLevelEntity>> planEither =
        await placePlanRepository.fetchPlacePlan(params.placeId);
    if (planEither.isRight()) {
      placePlanLevels = planEither.getOrElse(() => []);
    } else {
      return Left(FetchFailure());
    }

    Either<Failure, List<PlaceReservationEntity>> reservationsEither =
        await placeReservationsRepository.fetchPlaceReservations(
            params.placeId, DateTime(2023, 6, 14), DateTime(2023, 6, 15));
    if (reservationsEither.isRight()) {
      placeReservations = reservationsEither.getOrElse(() => []);
    } else {
      return Left(FetchFailure());
    }

    reserveSittings(placeReservations, placePlanLevels);

    return Right(
        PlaceConfigurationEntity(placeSettings, placePlanLevels));
  }

  void elementTapped(String planElementId) {
    PlacePlanElementEntity? tappedElement = findElement(planElementId);
    if (tappedElement != null && tappedElement.reserved == false) {
      if (tappedElement.type == 'T') {
        if (tappedElement.canReserveTable) {
          if (tappedElement.selected) {
            tableUnselected(tappedElement);
          } else {
            tableSelected(tappedElement);
          }
        }
      } else if (tappedElement.type == 'S') {
        if (tappedElement.selected) {
          sittingUnselected(tappedElement);
        } else {
          sittingSelected(tappedElement);
        }
      }
    }

    bool anyElementSelected =
        selectedElements.any((element) => element.selected);
    if (anyElementSelected) {
      editMode = true;
    } else {
      editMode = false;

      selectElements(selectedElements, false);
      highlightElements(highlightedElements, false);

      selectedElements = [];
      highlightedElements = [];
    }
  }

  void tableSelected(PlacePlanElementEntity tappedElement) {
    tappedElement.setSelected(true);
    tappedElement.setHighlighted(true);

    selectedElements.add(tappedElement);
    highlightedElements.add(tappedElement);

    List<PlacePlanElementEntity> tableSittings =
        findTableSittings(tappedElement);
    highlightElements(tableSittings, true);

    highlightedElements.addAll(tableSittings);
  }

  void tableUnselected(PlacePlanElementEntity tappedElement) {
    tappedElement.setSelected(false);
    tappedElement.setHighlighted(false);

    selectedElements.remove(tappedElement);
    highlightedElements.remove(tappedElement);

    List<PlacePlanElementEntity> tableSittings =
        findTableSittings(tappedElement);
    selectElements(tableSittings, false);
    highlightElements(tableSittings, false);

    tableSittings.forEach((element) {
      selectedElements.remove(element);
      highlightedElements.remove(element);
    });
  }

  void sittingSelected(PlacePlanElementEntity tappedElement) {
    if (tappedElement.connectedTable.isNotEmpty) {
      tappedElement.setSelected(true);
      tappedElement.setHighlighted(true);

      selectedElements.add(tappedElement);
      highlightedElements.add(tappedElement);

      List<PlacePlanElementEntity> otherSittingsInGroup =
          findOtherSittingsInTableGroup(tappedElement);
      highlightElements(otherSittingsInGroup, true);

      highlightedElements.addAll(otherSittingsInGroup);
    } else if (tappedElement.connectedSittings.isNotEmpty) {
      tappedElement.setSelected(true);
      tappedElement.setHighlighted(true);

      selectedElements.add(tappedElement);
      highlightedElements.add(tappedElement);

      List<PlacePlanElementEntity> connectedSittings =
          findConnectedSittings(tappedElement);
      highlightElements(connectedSittings, true);

      highlightedElements.addAll(connectedSittings);
    } else {
      tappedElement.setSelected(true);
      tappedElement.setHighlighted(true);

      selectedElements.add(tappedElement);
      highlightedElements.add(tappedElement);
    }
  }

  void sittingUnselected(PlacePlanElementEntity tappedElement) {
    if (tappedElement.connectedTable.isNotEmpty) {
      tappedElement.setSelected(false);

      selectedElements.remove(tappedElement);
    } else if (tappedElement.connectedSittings.isNotEmpty) {
      tappedElement.setSelected(false);

      selectedElements.remove(tappedElement);
    } else {
      tappedElement.setSelected(false);
      tappedElement.setHighlighted(false);

      selectedElements.remove(tappedElement);
      highlightedElements.remove(tappedElement);
    }
  }

  PlacePlanElementEntity? findElement(String planElementId) {
    Map<String, PlacePlanElementEntity> placePlan =
        placePlanLevels.first.placePlan;
    return placePlan[planElementId];
  }

  List<PlacePlanElementEntity> findTableSittings(
      PlacePlanElementEntity table) {
    List<PlacePlanElementEntity> tableSittings = [];

    bool hasGroupedSittings = table.groupedSittings.isNotEmpty;
    if (hasGroupedSittings) {
      table.groupedSittings.forEach((key, elements) {
        elements.forEach((element) {
          PlacePlanElementEntity? sitting = findElement(element);

          if (sitting != null) {
            tableSittings.add(sitting);
          } else {
            //log error
          }
        });
      });
    }

    return tableSittings;
  }

  List<PlacePlanElementEntity> findOtherSittingsInTableGroup(
      PlacePlanElementEntity sitting) {
    List<PlacePlanElementEntity> otherSittingsInGroup = [];

    PlacePlanElementEntity? connectedTable =
        findElement(sitting.connectedTable);
    if (connectedTable != null) {
      otherSittingsInGroup.add(connectedTable);

      bool hasGroupedSittings = connectedTable.groupedSittings.isNotEmpty;
      if (hasGroupedSittings) {
        connectedTable.groupedSittings.forEach((key, elements) {
          if (elements.contains(sitting.name)) {
            elements.forEach((element) {
              PlacePlanElementEntity? otherSitting = findElement(element);

              if (otherSitting != null && otherSitting.name != sitting.name) {
                otherSittingsInGroup.add(otherSitting);
              } else {
                //log error
              }
            });
          }
        });
      }
    }

    return otherSittingsInGroup;
  }

  List<PlacePlanElementEntity> findConnectedSittings(
      PlacePlanElementEntity sitting) {
    List<PlacePlanElementEntity> connectedSittings = [];

    sitting.connectedSittings.forEach((element) {
      PlacePlanElementEntity? sitting = findElement(element);

      if (sitting != null) {
        connectedSittings.add(sitting);
      } else {
        //log error
      }
    });

    return connectedSittings;
  }

  List<PlacePlanElementEntity> findAllConnectedElements(
      PlacePlanElementEntity element) {
    List<PlacePlanElementEntity> allConnectedElements = [];
    allConnectedElements.add(element);

    List<PlacePlanElementEntity> toAnalyze = [];
    toAnalyze.add(element);

    while (toAnalyze.isNotEmpty) {
      PlacePlanElementEntity currentlyAnalysed = toAnalyze.first;

      PlacePlanElementEntity? connectedTable =
          hasConnectedTable(currentlyAnalysed);
      if (connectedTable != null &&
          allConnectedElements.contains(connectedTable) == false) {
        toAnalyze.add(connectedTable);
        allConnectedElements.add(connectedTable);
      }

      List<PlacePlanElementEntity> connectedSittings =
          hasConnectedSittings(currentlyAnalysed);
      if (connectedSittings.isNotEmpty) {
        for (var connectedSitting in connectedSittings) {
          if (allConnectedElements.contains(connectedSitting) == false) {
            toAnalyze.add(connectedSitting);

            allConnectedElements.add(connectedSitting);
          }
        }
      }

      toAnalyze.remove(currentlyAnalysed);
    }

    return allConnectedElements;
  }

  PlacePlanElementEntity? hasConnectedTable(
      PlacePlanElementEntity element) {
    bool hasConnectedTable = element.connectedTable.isNotEmpty;
    if (hasConnectedTable) {
      PlacePlanElementEntity? connectedTable =
          findElement(element.connectedTable);
      if (connectedTable != null) {
        return connectedTable;
      } else {
        //log error
      }
    }
    return null;
  }

  List<PlacePlanElementEntity> hasConnectedSittings(
      PlacePlanElementEntity element) {
    List<PlacePlanElementEntity> connectedSittings = [];

    bool hasConnectedSittings = element.connectedSittings.isNotEmpty;
    if (hasConnectedSittings) {
      element.connectedSittings.forEach((id) {
        PlacePlanElementEntity? connectedSitting = findElement(id);
        if (connectedSitting != null) {
          connectedSittings.add(connectedSitting);
        } else {
          //log error
        }
      });
    }

    return connectedSittings;
  }

  void highlightElements(
      List<PlacePlanElementEntity> elements, bool highlighted) {
    elements.forEach((element) => element.highlighted = highlighted);
  }

  void selectElements(
      List<PlacePlanElementEntity> elements, bool selected) {
    elements.forEach((element) => element.selected = selected);
  }

  void reserveSittings(List<PlaceReservationEntity> placeReservations,
      List<PlacePlanLevelEntity> placePlanLevels) {}

  void reservationDateChanged(DateTime reservationDate) {
    this.reservationDate;
  }

  void reservationTimeChanged(TimeOfDay reservationTime) {
    this.reservationTime;
  }

  void editModeCancelled() {
    editMode = false;

    selectElements(selectedElements, false);
    highlightElements(highlightedElements, false);

    selectedElements = [];
    highlightedElements = [];
  }
}
