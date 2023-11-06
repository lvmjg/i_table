import '../../features/place_plan/data/model/place_plan/place_plan_element_model.dart';
import '../../features/place_plan/data/model/place_plan/place_plan_sitting_model.dart';

class PlanGenerator {
  List<PlacePlanElementModel> tables = [];
  List<PlacePlanSittingModel> sittings = [];
  List<PlacePlanElementModel> others = [];

  Map<String, PlacePlanElementModel> mapElements = {};

  PlanGenerator() {



    sittings
    //left four
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S1',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S2',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 1,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S3',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S4',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 1,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S5',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 3,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S6',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 4,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S7',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 3,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S8',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 4,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S9',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 6,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S10',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 7,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S11',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 6,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S12',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 7,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S13',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 9,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S14',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 10,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S15',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 9,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S16',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 10,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

    //right four
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S17',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S18',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 1,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S19',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S20',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 1,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S21',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 3,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S22',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 4,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S23',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 3,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S24',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 4,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S25',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 6,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S26',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 7,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S27',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 6,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S28',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 7,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S29',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 9,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S30',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 10,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S31',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 9,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S32',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 10,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

    //left two
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S33',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 12,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S34',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 12,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S35',
          columnStart: 0,
          columnSpan: 1,
          rowStart: 14,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S36',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 14,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

    //right two
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S37',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 12,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S38',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 12,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S39',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 14,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))

      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S40',
          columnStart: 6,
          columnSpan: 1,
          rowStart: 14,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))



    //free sittings
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S41',
          columnStart: 1,
          columnSpan: 1,
          rowStart: 17,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S42',
          columnStart: 2,
          columnSpan: 1,
          rowStart: 17,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S43',
          columnStart: 3,
          columnSpan: 1,
          rowStart: 17,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S44',
          columnStart: 4,
          columnSpan: 1,
          rowStart: 17,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ))
      ..add(PlacePlanSittingModel(
          type: 'S',
          name: 'S45',
          columnStart: 5,
          columnSpan: 1,
          rowStart: 17,
          rowSpan: 1,
          color: '#FFFFFF', group: '', table: ''
      ));

    tables
    //free tables
      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T13',
          columnStart: 1,
          columnSpan: 2,
          rowStart: 19,
          rowSpan: 1,
          color: '#FFFFFF'
      ))
      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T14',
          columnStart: 4,
          columnSpan: 2,
          rowStart: 19,
          rowSpan: 1,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T15',
          columnStart: 1,
          columnSpan: 1,
          rowStart: 21,
          rowSpan: 3,
          color: '#FFFFFF'
      ))
      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T16',
          columnStart: 3,
          columnSpan: 1,
          rowStart: 21,
          rowSpan: 3,
          color: '#FFFFFF'
      ))
      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T17',
          columnStart: 5,
          columnSpan: 1,
          rowStart: 21,
          rowSpan: 3,
          color: '#FFFFFF'
      ))



    ..add(PlacePlanElementModel(
    type: 'T',
    name: 'T1',
    columnStart: 1,
    columnSpan: 1,
    rowStart: 0,
    rowSpan: 2,
    color: '#FFFFFF'
    ))
      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T2',
          columnStart: 1,
          columnSpan: 1,
          rowStart: 3,
          rowSpan: 2,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T3',
          columnStart: 1,
          columnSpan: 1,
          rowStart: 6,
          rowSpan: 2,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T4',
          columnStart: 1,
          columnSpan: 1,
          rowStart: 9,
          rowSpan: 2,
          color: '#FFFFFF'
      ))
      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T5',
          columnStart: 5,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 2,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T6',
          columnStart: 5,
          columnSpan: 1,
          rowStart: 3,
          rowSpan: 2,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T7',
          columnStart: 5,
          columnSpan: 1,
          rowStart: 6,
          rowSpan: 2,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T8',
          columnStart: 5,
          columnSpan: 1,
          rowStart: 9,
          rowSpan: 2,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T9',
          columnStart: 1,
          columnSpan: 1,
          rowStart: 12,
          rowSpan: 1,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T10',
          columnStart: 1,
          columnSpan: 1,
          rowStart: 14,
          rowSpan: 1,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T11',
          columnStart: 5,
          columnSpan: 1,
          rowStart: 12,
          rowSpan: 1,
          color: '#FFFFFF'
      ))

      ..add(PlacePlanElementModel(
          type: 'T',
          name: 'T12',
          columnStart: 5,
          columnSpan: 1,
          rowStart: 14,
          rowSpan: 1,
          color: '#FFFFFF'
      ));

    others
    //aqua
      ..add(PlacePlanElementModel(
          type: 'O',
          name: 'Akwarium',
          columnStart: 1,
          columnSpan: 5,
          rowStart: 16,
          rowSpan: 1,
          color: '#3440eb'
      ))

    //bar
      ..add(PlacePlanElementModel(
          type: 'O',
          name: 'Bar',
          columnStart: 4,
          columnSpan: 3,
          rowStart: 25,
          rowSpan: 1,
          color: '#FFFFFF'
      ))

    //entrance

      ..add(PlacePlanElementModel(
          type: 'O',
          name: 'Wejście',
          columnStart: 0,
          columnSpan: 9,
          rowStart: 27,
          rowSpan: 1,
          color: '#3b3b3b'
      ))

    //Plants
      ..add(PlacePlanElementModel(
          type: 'O',
          name: 'X',
          columnStart: 8,
          columnSpan: 1,
          rowStart: 1,
          rowSpan: 3,
          color: '#00b01e'
      ))
      ..add(PlacePlanElementModel(
          type: 'O',
          name: 'X',
          columnStart: 8,
          columnSpan: 1,
          rowStart: 7,
          rowSpan: 3,
          color: '#00b01e'
      ));



    /* //two groups
    elements[0].table = 'T1';
    elements[1].table = 'T1';
    elements[2].canReserveTable = true;
    elements[2].groupedSittings = <String, List<String>>{
      'group1': ['S1', 'S2'],
      'group2': ['S3', 'S4'],
    };
    elements[3].table = 'T1';
    elements[4].table = 'T1';

    //one group
    elements[5].table = 'T2';
    elements[6].table = 'T2';
    elements[7].canReserveTable = true;
    elements[7].groupedSittings = <String, List<String>>{
      'group1': ['S5', 'S6', 'S7', 'S8'],
    };
    elements[8].table = 'T2';
    elements[9].table = 'T2';

    //two groups - cant reserve table
    elements[10].table = 'T3';
    elements[11].table = 'T3';
    elements[12].canReserveTable = false;
    elements[12].groupedSittings = <String, List<String>>{
      'group1': ['S9', 'S10'],
      'group2': ['S11', 'S12'],
    };
    elements[13].table = 'T3';
    elements[14].table = 'T3';

    //one group - cant reserve table
    elements[15].table = 'T4';
    elements[16].table = 'T4';
    elements[17].canReserveTable = false;
    elements[17].groupedSittings = <String, List<String>>{
      'group1': ['S13', 'S14', 'S15', 'S16']
    };
    elements[18].table = 'T4';
    elements[19].table = 'T4';

    //only table 1
    elements[20].table = 'T5';
    elements[21].table = 'T5';
    elements[22].canReserveTable = false;
    elements[22].groupedSittings = <String, List<String>>{};
    elements[23].table = 'T5';
    elements[24].table = 'T5';

    //only table 2
    elements[25].table = 'T6';
    elements[26].table = 'T6';
    elements[27].canReserveTable = false;
    elements[27].groupedSittings = <String, List<String>>{};
    elements[28].table = 'T6';
    elements[29].table = 'T6';

    //only table 2
    elements[25].table = 'T6';
    elements[26].table = 'T6';
    elements[27].canReserveTable = false;
    elements[27].groupedSittings = <String, List<String>>{};
    elements[28].table = 'T6';
    elements[29].table = 'T6';*/
  }

  Map<String, dynamic> getJson() {
    Map<String, dynamic> tablesJson = {};
    tables.forEach((element) {
      tablesJson[element.name] = element.toJson();
    });

    Map<String, dynamic> sittingsJson = {};
    sittings.forEach((element) {
      sittingsJson[element.name] = element.toJson();
    });

    Map<String, dynamic> othersJson = {};
    others.forEach((element) {
      othersJson[element.name] = element.toJson();
    });

    return <String, dynamic>{
      'placePlanLevelId': '1',
      'placePlanLevelName': 'Piętro 1',
      'placePlanLevelOrder': 0,
      'placePlanTables': tablesJson,
      'placePlanSittings': sittingsJson,
      'placePlanOthers':  othersJson,
    };
  }

  Map<String, dynamic> getJson2() {
    /*List<PlacePlanElementModel>? elements2 = List.of(elements);
    elements2 = elements2.take(elements2.length-9).toList();

  /*  elements2.forEach((element) {
      element.id = element.name;
    });*/

    Map<String, dynamic> allElements = {};
    for (PlacePlanElementModel pee in elements2) {
      allElements.addAll(pee.toJson());
    }

    return <String, dynamic>{
      'placePlan': allElements,
      'placePlanLevelId': '1',
      'placePlanLevelName': 'Piętro 1',
      'placePlanLevelOrder': 0
    };*/
    return {};
  }
}
