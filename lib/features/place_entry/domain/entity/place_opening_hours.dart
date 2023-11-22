import 'package:i_table/features/place_entry/domain/entity/place_work_day.dart';

class PlaceOpeningHours {
  final PlaceWorkDay monday;
  final PlaceWorkDay tuesday;
  final PlaceWorkDay wednesday;
  final PlaceWorkDay thursday;
  final PlaceWorkDay friday;
  final PlaceWorkDay saturday;
  final PlaceWorkDay sunday;

  PlaceOpeningHours(
      {required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday});
}
