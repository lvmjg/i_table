import 'package:flutter/src/material/time.dart';

import '../../data/repositories/restaurant_plan_repository.dart';
import '../entities/reservation/reservation_entity.dart';
import '../entities/restaurant_configuration/restaurant_configuration_entity.dart';
import '../entities/restaurant_plan/restaurant_plan_element_entity.dart';
import '../entities/restaurant_plan/restaurant_plan_level_entity.dart';
import '../entities/restaurant_plan/restaurant_setting.dart';

class RestaurantPlanUseCase{

  RestaurantConfigurationEntity? restaurantConfiguration;
  List<RestaurantPlanLevelEntity> restaurantPlanLevels = [];
  List<ReservationEntity> restaurantReservations = [];

  DateTime? reservationDate;
  TimeOfDay? reservationTime;

  bool editMode = false;
  List<RestaurantPlanElementEntity> selectedElements = [];

  Future<RestaurantSetting> fetchRestaurantSetting(String restaurantId) async {
    RestaurantPlanRepository restaurantPlanRepository = RestaurantPlanRepository();

    restaurantConfiguration = await restaurantPlanRepository.fetchConfiguration(restaurantId);

    restaurantPlanLevels = await restaurantPlanRepository.fetchRestaurantPlan(restaurantId);

    restaurantReservations = await restaurantPlanRepository.fetchRestaurantReservations(restaurantId, DateTime(2023, 6, 14), DateTime(2023, 6, 15));

    reserveSittings(restaurantReservations, restaurantPlanLevels);

    return RestaurantSetting(restaurantConfiguration, restaurantPlanLevels);
  }

  void elementTapped(String planElementId){
    RestaurantPlanElementEntity? tappedElement = findElement(planElementId);
    if(tappedElement!=null){
      tappedElement.select();

      editMode = selectedElements.any((element) => element.selected);


      if(tappedElement.type=='T'){
        selectTableSittings(tappedElement);
        highlightConnectedSittings(tappedElement);
      }
      else if(tappedElement.type=='S'){
        highlightConnectedSittings(tappedElement);
      }
    }
  }

  RestaurantPlanElementEntity? findElement(String planElementId){
    Map<String, RestaurantPlanElementEntity> restaurantPlan = restaurantPlanLevels.first.restaurantPlan;
    return restaurantPlan[planElementId];
  }

  void selectTableSittings(RestaurantPlanElementEntity table) {
    bool hasConnectedSittings = table.connectedSittings.isNotEmpty;

    if (hasConnectedSittings) {
      List<String> sittings = table.connectedSittings;
      sittings.forEach(
              (element) {
            RestaurantPlanElementEntity? sitting = findElement(element);

            if (sitting != null) {
              sitting.forceSelect();
            }
            else {
              //log error
            }
          }
      );
    }
  }

  void highlightConnectedSittings(RestaurantPlanElementEntity element){
    List<String> alreadyHighlightedElements = [];
    alreadyHighlightedElements.add(element.name);

    highlightConnectedSittingsRec(element, alreadyHighlightedElements);
  }

  void highlightConnectedSittingsRec(RestaurantPlanElementEntity element, List<String> alreadyHighlightedElements){
    bool hasConnectedTable = element.connectedTable.isNotEmpty;

    if(hasConnectedTable){

      if(alreadyHighlightedElements.contains(element.connectedTable) == false) {
        RestaurantPlanElementEntity? connectedTable = findElement(
            element.connectedTable);

        if (connectedTable != null) {
          connectedTable.highlight();

          alreadyHighlightedElements.add(connectedTable.name);

          highlightConnectedSittingsRec(
              connectedTable, alreadyHighlightedElements);
        }
        else {
          //log error
        }
      }
    }

    bool hasConnectedSittings = element.connectedSittings.isNotEmpty;

    if(hasConnectedSittings){
      List<String> connectedSittings = element.connectedSittings;
      connectedSittings.forEach(
              (id){

            if(alreadyHighlightedElements.contains(id) == false) {
              RestaurantPlanElementEntity? connectedSitting = findElement(id);

              if (connectedSitting != null) {
                connectedSitting.highlight();

                alreadyHighlightedElements.add(connectedSitting.name);

                highlightConnectedSittingsRec(connectedSitting, alreadyHighlightedElements);
              }
              else {
                //log error
              }
            }
          }
      );
    }
  }

  void reserveSittings(List<ReservationEntity> restaurantReservations, List<RestaurantPlanLevelEntity> restaurantPlanLevels) {

  }

  void reservationDateChanged(DateTime reservationDate) {
    this.reservationDate;
  }

  void reservationTimeChanged(TimeOfDay reservationTime) {
    this.reservationTime;
  }

}