import 'package:dartz/dartz.dart';
import 'package:flutter/src/material/time.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/features/restaurant_details/domain/usecase/fetch_restaurant_details.dart';
import 'package:i_table/features/restaurant_plan/data/datasources/restaurant_configuration_remote_data_source.dart';
import 'package:i_table/features/restaurant_plan/data/repositories/restaurant_configuration_repository_impl.dart';
import 'package:i_table/features/restaurant_plan/data/repositories/restaurant_plan_repository_impl.dart';

import '../../data/datasources/restaurant_plan_remote_data_source.dart';
import '../../data/datasources/restaurant_reservations_remote_data_source.dart';
import '../../data/repositories/restaurant_reservations_repository_impl.dart';
import '../entities/reservation/reservation_entity.dart';
import '../entities/restaurant_configuration/restaurant_configuration_entity.dart';
import '../entities/restaurant_plan/restaurant_plan_element_entity.dart';
import '../entities/restaurant_plan/restaurant_plan_level_entity.dart';
import '../entities/restaurant_plan/restaurant_setting.dart';

class ManageRestaurant implements UseCase<RestaurantSetting, RestaurantIdParams> {

  final RestaurantConfigurationRepositoryImpl restaurantConfigurationRepository = RestaurantConfigurationRepositoryImpl(RestaurantConfigurationRemoteDataSourceImpl());
  final RestaurantPlanRepositoryImpl restaurantPlanRepository = RestaurantPlanRepositoryImpl(RestaurantPlanRemoteDataSourceImpl());
  final RestaurantReservationsRepositoryImpl restaurantReservationsRepository = RestaurantReservationsRepositoryImpl(RestaurantReservationsRemoteDataSourceImpl());

  RestaurantConfigurationEntity? restaurantConfiguration;
  List<RestaurantPlanLevelEntity> restaurantPlanLevels = [];
  List<ReservationEntity> restaurantReservations = [];

  DateTime? reservationDate;
  TimeOfDay? reservationTime;

  bool editMode = false;
  List<RestaurantPlanElementEntity> selectedElements = [];
  List<RestaurantPlanElementEntity> highlightedElements = [];

  @override
  Future<Either<Failure, RestaurantSetting>> call(RestaurantIdParams params) async {
    Either<Failure, RestaurantConfigurationEntity?> configurationEither = await restaurantConfigurationRepository.fetchRestaurantConfiguration(params.restaurantId);
    configurationEither.fold((failure){
      return Left(failure);
    }, (restaurantConfiguration){
      restaurantConfiguration = restaurantConfiguration;
    });

    Either<Failure, List<RestaurantPlanLevelEntity>> planEither = await  restaurantPlanRepository.fetchRestaurantPlan(params.restaurantId);
    if(planEither.isRight()){
      restaurantPlanLevels = planEither.getOrElse(() => []);
    }
    else {
      return Left(FetchFailure());
    }

    Either<Failure, List<ReservationEntity>> reservationsEither = await  restaurantReservationsRepository.fetchRestaurantReservations(params.restaurantId, DateTime(2023, 6, 14), DateTime(2023, 6, 15));
    if(reservationsEither.isRight()){
      restaurantReservations = reservationsEither.getOrElse(() => []);
    }
    else {
      return Left(FetchFailure());
    }

    reserveSittings(restaurantReservations, restaurantPlanLevels);

    return Right(RestaurantSetting(restaurantConfiguration, restaurantPlanLevels));
  }

  void elementTapped(String planElementId) {
    RestaurantPlanElementEntity? tappedElement = findElement(planElementId);
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

  void tableSelected(RestaurantPlanElementEntity tappedElement) {
    tappedElement.setSelected(true);
    tappedElement.setHighlighted(true);

    selectedElements.add(tappedElement);
    highlightedElements.add(tappedElement);

    List<RestaurantPlanElementEntity> tableSittings =
        findTableSittings(tappedElement);
    highlightElements(tableSittings, true);

    highlightedElements.addAll(tableSittings);
  }

  void tableUnselected(RestaurantPlanElementEntity tappedElement) {
    tappedElement.setSelected(false);
    tappedElement.setHighlighted(false);

    selectedElements.remove(tappedElement);
    highlightedElements.remove(tappedElement);

    List<RestaurantPlanElementEntity> tableSittings =
        findTableSittings(tappedElement);
    selectElements(tableSittings, false);
    highlightElements(tableSittings, false);

    tableSittings.forEach((element) {
      selectedElements.remove(element);
      highlightedElements.remove(element);
    });
  }

  void sittingSelected(RestaurantPlanElementEntity tappedElement) {
    if(tappedElement.connectedTable.isNotEmpty) {
      tappedElement.setSelected(true);
      tappedElement.setHighlighted(true);

      selectedElements.add(tappedElement);
      highlightedElements.add(tappedElement);

      List<RestaurantPlanElementEntity> otherSittingsInGroup =
      findOtherSittingsInTableGroup(tappedElement);
      highlightElements(otherSittingsInGroup, true);

      highlightedElements.addAll(otherSittingsInGroup);
    }
    else if(tappedElement.connectedSittings.isNotEmpty) {
      tappedElement.setSelected(true);
      tappedElement.setHighlighted(true);

      selectedElements.add(tappedElement);
      highlightedElements.add(tappedElement);

      List<RestaurantPlanElementEntity> connectedSittings =
      findConnectedSittings(tappedElement);
      highlightElements(connectedSittings, true);

      highlightedElements.addAll(connectedSittings);
    }
    else{
      tappedElement.setSelected(true);
      tappedElement.setHighlighted(true);

      selectedElements.add(tappedElement);
      highlightedElements.add(tappedElement);
    }
  }

  void sittingUnselected(RestaurantPlanElementEntity tappedElement) {
    if(tappedElement.connectedTable.isNotEmpty) {
      tappedElement.setSelected(false);

      selectedElements.remove(tappedElement);
    }
    else if(tappedElement.connectedSittings.isNotEmpty) {
      tappedElement.setSelected(false);

      selectedElements.remove(tappedElement);
    }
    else {
      tappedElement.setSelected(false);
      tappedElement.setHighlighted(false);

      selectedElements.remove(tappedElement);
      highlightedElements.remove(tappedElement);
    }
  }

  RestaurantPlanElementEntity? findElement(String planElementId) {
    Map<String, RestaurantPlanElementEntity> restaurantPlan =
        restaurantPlanLevels.first.restaurantPlan;
    return restaurantPlan[planElementId];
  }

  List<RestaurantPlanElementEntity> findTableSittings(
      RestaurantPlanElementEntity table) {
    List<RestaurantPlanElementEntity> tableSittings = [];

    bool hasGroupedSittings = table.groupedSittings.isNotEmpty;
    if (hasGroupedSittings) {
      table.groupedSittings.forEach((key, elements) {
        elements.forEach((element) {
          RestaurantPlanElementEntity? sitting = findElement(element);

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

  List<RestaurantPlanElementEntity> findOtherSittingsInTableGroup(
      RestaurantPlanElementEntity sitting) {
    List<RestaurantPlanElementEntity> otherSittingsInGroup = [];

    RestaurantPlanElementEntity? connectedTable = findElement(sitting.connectedTable);
    if(connectedTable!=null){
      otherSittingsInGroup.add(connectedTable);

      bool hasGroupedSittings = connectedTable.groupedSittings.isNotEmpty;
      if (hasGroupedSittings) {
        connectedTable.groupedSittings.forEach((key, elements) {
          if (elements.contains(sitting.name)) {
            elements.forEach((element) {
              RestaurantPlanElementEntity? otherSitting = findElement(element);

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

  List<RestaurantPlanElementEntity> findConnectedSittings(
      RestaurantPlanElementEntity sitting) {
    List<RestaurantPlanElementEntity> connectedSittings = [];

    sitting.connectedSittings.forEach((element) {
      RestaurantPlanElementEntity? sitting = findElement(element);

      if (sitting != null) {
        connectedSittings.add(sitting);
      } else {
        //log error
      }
    });

    return connectedSittings;
  }

  List<RestaurantPlanElementEntity> findAllConnectedElements(
      RestaurantPlanElementEntity element) {
    List<RestaurantPlanElementEntity> allConnectedElements = [];
    allConnectedElements.add(element);

    List<RestaurantPlanElementEntity> toAnalyze = [];
    toAnalyze.add(element);

    while (toAnalyze.isNotEmpty) {
      RestaurantPlanElementEntity currentlyAnalysed = toAnalyze.first;

      RestaurantPlanElementEntity? connectedTable =
          hasConnectedTable(currentlyAnalysed);
      if (connectedTable != null &&
          allConnectedElements.contains(connectedTable) == false) {
        toAnalyze.add(connectedTable);
        allConnectedElements.add(connectedTable);
      }

      List<RestaurantPlanElementEntity> connectedSittings =
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

  RestaurantPlanElementEntity? hasConnectedTable(
      RestaurantPlanElementEntity element) {
    bool hasConnectedTable = element.connectedTable.isNotEmpty;
    if (hasConnectedTable) {
      RestaurantPlanElementEntity? connectedTable =
          findElement(element.connectedTable);
      if (connectedTable != null) {
        return connectedTable;
      } else {
        //log error
      }
    }
    return null;
  }

  List<RestaurantPlanElementEntity> hasConnectedSittings(
      RestaurantPlanElementEntity element) {
    List<RestaurantPlanElementEntity> connectedSittings = [];

    bool hasConnectedSittings = element.connectedSittings.isNotEmpty;
    if (hasConnectedSittings) {
      element.connectedSittings.forEach((id) {
        RestaurantPlanElementEntity? connectedSitting = findElement(id);
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
      List<RestaurantPlanElementEntity> elements, bool highlighted) {
    elements.forEach((element) => element.highlighted = highlighted);
  }

  void selectElements(
      List<RestaurantPlanElementEntity> elements, bool selected) {
    elements.forEach((element) => element.selected = selected);
  }

  void reserveSittings(List<ReservationEntity> restaurantReservations,
      List<RestaurantPlanLevelEntity> restaurantPlanLevels) {}

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
