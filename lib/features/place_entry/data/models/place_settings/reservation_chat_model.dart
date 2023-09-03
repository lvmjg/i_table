import 'package:json_annotation/json_annotation.dart';

part 'reservation_chat_model.g.dart';

@JsonSerializable()
class ReservationChatModel{
  @JsonKey(defaultValue: true)
  final bool chatEnabled;
  @JsonKey(defaultValue: 30)
  final int maxNumberOfMessages;

  ReservationChatModel({required this.chatEnabled, required this.maxNumberOfMessages});

  factory ReservationChatModel.fromJson(Map<String, dynamic> json) => _$ReservationChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationChatModelToJson(this);
}