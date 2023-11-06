import 'package:i_table/core/util/string_util.dart';

class SittingsFormatter{

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
}