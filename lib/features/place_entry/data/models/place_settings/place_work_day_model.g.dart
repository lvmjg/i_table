// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_work_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceWorkDayModel _$PlaceWorkDayModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['open', 'close'],
  );
  return PlaceWorkDayModel(
    open: json['open'] as String,
    close: json['close'] as String,
  );
}

Map<String, dynamic> _$PlaceWorkDayModelToJson(PlaceWorkDayModel instance) =>
    <String, dynamic>{
      'open': instance.open,
      'close': instance.close,
    };
