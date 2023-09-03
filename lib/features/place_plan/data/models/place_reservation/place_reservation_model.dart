import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_reservation_model.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}


@JsonSerializable()
class PlaceReservationModel {
  @JsonKey(required: true)
  final String placeId;
  @JsonKey(required: true)
  final String userId;
  @TimestampConverter()
  final DateTime startDate;
  @JsonKey(defaultValue: 0)
  final int duration;
  @JsonKey(required: true)
  final int people;
  @JsonKey(defaultValue: <String, Map<String, List<String>>>{})
  final Map<String, Map<String, List<String>>> tables;
  @JsonKey(defaultValue: <String, List<String>>{})
  final Map<String, List<String>> groups;
  @JsonKey(defaultValue: <String>[])
  final List<String> sittings;

  PlaceReservationModel(
      {required this.placeId,
      required this.userId,
      required this.startDate,
      required this.duration,
      required this.people,
      required this.tables,
      required this.groups,
      required this.sittings});

  factory PlaceReservationModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceReservationModelToJson(this);
}
