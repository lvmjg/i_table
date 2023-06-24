import '../../features/restaurant_plan/domain/entities/restaurant_plan/restaurant_plan_element_entity.dart';

class PlanGenerator {
  List<RestaurantPlanElementEntity> elements = [];

  PlanGenerator() {
    // elements
    // //left four
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S1',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 0,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S2',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 1,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T1',
    //       columnStart: 1,
    //       columnSpan: 1,
    //       rowStart: 0,
    //       rowSpan: 2,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S3',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 0,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S4',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 1,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S5',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 3,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S6',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 4,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T2',
    //       columnStart: 1,
    //       columnSpan: 1,
    //       rowStart: 3,
    //       rowSpan: 2,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S7',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 3,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S8',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 4,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S9',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 6,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S10',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 7,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T3',
    //       columnStart: 1,
    //       columnSpan: 1,
    //       rowStart: 6,
    //       rowSpan: 2,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S11',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 6,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S12',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 7,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S13',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 9,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S14',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 10,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T4',
    //       columnStart: 1,
    //       columnSpan: 1,
    //       rowStart: 9,
    //       rowSpan: 2,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S15',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 9,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S16',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 10,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    // //right four
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S17',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 0,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S18',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 1,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T5',
    //       columnStart: 5,
    //       columnSpan: 1,
    //       rowStart: 0,
    //       rowSpan: 2,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S19',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 0,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S20',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 1,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S21',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 3,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S22',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 4,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T6',
    //       columnStart: 5,
    //       columnSpan: 1,
    //       rowStart: 3,
    //       rowSpan: 2,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S23',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 3,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S24',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 4,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S25',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 6,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S26',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 7,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T7',
    //       columnStart: 5,
    //       columnSpan: 1,
    //       rowStart: 6,
    //       rowSpan: 2,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S27',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 6,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S28',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 7,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S29',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 9,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S30',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 10,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T8',
    //       columnStart: 5,
    //       columnSpan: 1,
    //       rowStart: 9,
    //       rowSpan: 2,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S31',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 9,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S32',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 10,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    // //left two
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S33',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 12,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T9',
    //       columnStart: 1,
    //       columnSpan: 1,
    //       rowStart: 12,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S34',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 12,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S35',
    //       columnStart: 0,
    //       columnSpan: 1,
    //       rowStart: 14,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T10',
    //       columnStart: 1,
    //       columnSpan: 1,
    //       rowStart: 14,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S36',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 14,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    // //right two
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S37',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 12,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T11',
    //       columnStart: 5,
    //       columnSpan: 1,
    //       rowStart: 12,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S38',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 12,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S39',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 14,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T12',
    //       columnStart: 5,
    //       columnSpan: 1,
    //       rowStart: 14,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S40',
    //       columnStart: 6,
    //       columnSpan: 1,
    //       rowStart: 14,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    // //aqua
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'O',
    //       name: 'Akwarium',
    //       columnStart: 1,
    //       columnSpan: 5,
    //       rowStart: 16,
    //       rowSpan: 1,
    //       color: '#3440eb'
    //   ))
    //
    // //free sittings
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S41',
    //       columnStart: 1,
    //       columnSpan: 1,
    //       rowStart: 17,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S42',
    //       columnStart: 2,
    //       columnSpan: 1,
    //       rowStart: 17,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S43',
    //       columnStart: 3,
    //       columnSpan: 1,
    //       rowStart: 17,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S44',
    //       columnStart: 4,
    //       columnSpan: 1,
    //       rowStart: 17,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'S',
    //       name: 'S45',
    //       columnStart: 5,
    //       columnSpan: 1,
    //       rowStart: 17,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    // //free tables
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T13',
    //       columnStart: 1,
    //       columnSpan: 2,
    //       rowStart: 19,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T14',
    //       columnStart: 4,
    //       columnSpan: 2,
    //       rowStart: 19,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T15',
    //       columnStart: 1,
    //       columnSpan: 1,
    //       rowStart: 21,
    //       rowSpan: 3,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T16',
    //       columnStart: 3,
    //       columnSpan: 1,
    //       rowStart: 21,
    //       rowSpan: 3,
    //       color: '#FFFFFF'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'T',
    //       name: 'T17',
    //       columnStart: 5,
    //       columnSpan: 1,
    //       rowStart: 21,
    //       rowSpan: 3,
    //       color: '#FFFFFF'
    //   ))
    //
    // //bar
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'O',
    //       name: 'Bar',
    //       columnStart: 4,
    //       columnSpan: 3,
    //       rowStart: 25,
    //       rowSpan: 1,
    //       color: '#FFFFFF'
    //   ))
    //
    // //entrance
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'O',
    //       name: 'Wejście',
    //       columnStart: 0,
    //       columnSpan: 9,
    //       rowStart: 27,
    //       rowSpan: 1,
    //       color: '#3b3b3b'
    //   ))
    //
    // //Plants
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'O',
    //       name: 'X',
    //       columnStart: 8,
    //       columnSpan: 1,
    //       rowStart: 1,
    //       rowSpan: 3,
    //       color: '#00b01e'
    //   ))
    //   ..add(RestaurantPlanElementEntity(
    //       type: 'O',
    //       name: 'X',
    //       columnStart: 8,
    //       columnSpan: 1,
    //       rowStart: 7,
    //       rowSpan: 3,
    //       color: '#00b01e'
    //   ));
  }

  List<RestaurantPlanElementEntity> get() {
    return elements;
  }

  Map<String, dynamic> getJson() {
    elements.forEach((element) {
      element.id = element.name;
    });

    Map<String, dynamic> allElements = {};
    for (RestaurantPlanElementEntity pee in elements) {
      allElements.addAll(pee.toJson());
    }

    return <String, dynamic>{'restaurantPlan': allElements};
  }
}
