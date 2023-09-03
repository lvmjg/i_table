// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceReservationModel _$PlaceReservationModelFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['placeId', 'userId', 'people'],
  );
  return PlaceReservationModel(
    placeId: json['placeId'] as String,
    userId: json['userId'] as String,
    startDate:
        const TimestampConverter().fromJson(json['startDate'] as Timestamp),
    duration: json['duration'] as int? ?? 0,
    people: json['people'] as int,
    tables: (json['tables'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(
                    k, (e as List<dynamic>).map((e) => e as String).toList()),
              )),
        ) ??
        {},
    groups: (json['groups'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List<dynamic>).map((e) => e as String).toList()),
        ) ??
        {},
    sittings: (json['sittings'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$PlaceReservationModelToJson(
        PlaceReservationModel instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'userId': instance.userId,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'duration': instance.duration,
      'people': instance.people,
      'tables': instance.tables,
      'groups': instance.groups,
      'sittings': instance.sittings,
    };
