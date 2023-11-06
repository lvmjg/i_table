import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/util/json_converter.dart';

part 'place_reservation_model.g.dart';

@JsonSerializable()
class PlaceReservationModel {
  @JsonKey(includeFromJson: false, includeToJson: false)
  late String id;
  late String no;
  @JsonKey(required: true)
  final String placeId;
  @JsonKey(required: true)
  final String placeName;
  @JsonKey(required: true)
  final String placeAddress;
  final String userId;
  @TimestampConverter()
  final DateTime startDate;
  @JsonKey(defaultValue: 0)
  final int duration;
  @JsonKey(required: true)
  final int people;
  @JsonKey(required: true)
  final String status;
  @JsonKey(defaultValue: <String, Map<String, List<String>>>{})
  final Map<String, Map<String, List<String>>> tables;
  @JsonKey(defaultValue: <String, List<String>>{})
  final Map<String, List<String>> groups;
  @JsonKey(defaultValue: <String>[])
  final List<String> sittings;

  PlaceReservationModel(
      {required this.no,
      required this.placeId,
      required this.placeName,
      required this.placeAddress,
      required this.userId,
      required this.startDate,
      required this.duration,
      required this.people,
      required this.status,
      required this.tables,
      required this.groups,
      required this.sittings});

  factory PlaceReservationModel.fromJson(
      String reservationId, Map<String, dynamic> json) {
    PlaceReservationModel placeReservationModel =
        _$PlaceReservationModelFromJson(json);
    placeReservationModel.id = reservationId;
    return placeReservationModel;
  }

  Map<String, dynamic> toJson() => _$PlaceReservationModelToJson(this);
}
