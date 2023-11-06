// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationChatModel _$ReservationChatModelFromJson(
        Map<String, dynamic> json) =>
    ReservationChatModel(
      chatEnabled: json['chatEnabled'] as bool? ?? true,
      maxNumberOfMessages: json['maxNumberOfMessages'] as int? ?? 30,
    );

Map<String, dynamic> _$ReservationChatModelToJson(
        ReservationChatModel instance) =>
    <String, dynamic>{
      'chatEnabled': instance.chatEnabled,
      'maxNumberOfMessages': instance.maxNumberOfMessages,
    };
