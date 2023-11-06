import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/util/json_converter.dart';
import '../../../place_plan/data/model/place_reservation/place_reservation_model.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel {
  final String sender;
  @TimestampConverter()
  final DateTime sendTime;
  final String message;

  ChatMessageModel(
      {required this.sender, required this.sendTime, required this.message});

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
}
