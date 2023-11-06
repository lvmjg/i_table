// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      sender: json['sender'] as String,
      sendTime:
          const TimestampConverter().fromJson(json['sendTime'] as Timestamp),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'sendTime': const TimestampConverter().toJson(instance.sendTime),
      'message': instance.message,
    };
