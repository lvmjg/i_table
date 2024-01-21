// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceReservationModel _$PlaceReservationModelFromJson(
        Map<String, dynamic> json) =>
    PlaceReservationModel(
      no: json['no'] as String,
      placeId: json['placeId'] as String,
      placeName: json['placeName'] as String,
      placeAddress: json['placeAddress'] as String,
      userId: json['userId'] as String,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp),
      duration: json['duration'] as int? ?? 0,
      people: json['people'] as int,
      status: json['status'] as String,
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
      createDate:
          const TimestampConverter().fromJson(json['createDate'] as Timestamp),
      updateDate:
          const TimestampConverter().fromJson(json['updateDate'] as Timestamp),
      closedBy: json['closedBy'] as String,
    );

Map<String, dynamic> _$PlaceReservationModelToJson(
        PlaceReservationModel instance) =>
    <String, dynamic>{
      'no': instance.no,
      'placeId': instance.placeId,
      'placeName': instance.placeName,
      'placeAddress': instance.placeAddress,
      'userId': instance.userId,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'duration': instance.duration,
      'people': instance.people,
      'status': instance.status,
      'tables': instance.tables,
      'groups': instance.groups,
      'sittings': instance.sittings,
      'createDate': const TimestampConverter().toJson(instance.createDate),
      'updateDate': const TimestampConverter().toJson(instance.updateDate),
      'closedBy': instance.closedBy,
    };
