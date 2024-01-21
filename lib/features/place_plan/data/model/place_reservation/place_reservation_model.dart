import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/util/json_converter.dart';

part 'place_reservation_model.g.dart';

@JsonSerializable()
class PlaceReservationModel {
  @JsonKey(includeFromJson: false, includeToJson: false)
  late String id;
  @JsonKey()
  late String no;
  @JsonKey()
  final String placeId;
  @JsonKey()
  final String placeName;
  @JsonKey()
  final String placeAddress;
  @JsonKey()
  final String userId;
  @TimestampConverter()
  final DateTime startDate;
  @JsonKey(defaultValue: 0)
  final int duration;
  @JsonKey()
  final int people;
  @JsonKey()
  final String status;
  @JsonKey(defaultValue: <String, Map<String, List<String>>>{})
  final Map<String, Map<String, List<String>>> tables;
  @JsonKey(defaultValue: <String, List<String>>{})
  final Map<String, List<String>> groups;
  @JsonKey(defaultValue: <String>[])
  final List<String> sittings;
  @TimestampConverter()
  final DateTime createDate;
  @TimestampConverter()
  final DateTime updateDate;
  @JsonKey()
  final String closedBy;

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
      required this.sittings,
      required this.createDate,
      required this.updateDate,
      required this.closedBy});

  factory PlaceReservationModel.fromJson(
      String reservationId, Map<String, dynamic> json) {
    PlaceReservationModel placeReservationModel =
        _$PlaceReservationModelFromJson(json);
    placeReservationModel.id = reservationId;
    return placeReservationModel;
  }

  Map<String, dynamic> toJson() => _$PlaceReservationModelToJson(this);
}
