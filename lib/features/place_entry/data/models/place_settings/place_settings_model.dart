import 'package:i_table/features/place_entry/data/models/place_settings/place_opening_hours_model.dart';
import 'package:i_table/features/place_entry/data/models/place_settings/reservation_chat_model.dart';
import 'package:i_table/features/place_entry/data/models/place_settings/reservation_confirmation_model.dart';
import 'package:i_table/features/place_entry/data/models/place_settings/reservation_logic_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_settings_model.g.dart';

@JsonSerializable()
class PlaceSettingsModel{
  @JsonKey(required: true)
  final String placeId;
  @JsonKey(required: true)
  final String placeName;
  @JsonKey(required: true)
  final ReservationLogicModel reservationLogic;
  @JsonKey(required: true)
  final ReservationChatModel reservationChat;
  @JsonKey(required: true)
  final ReservationConfirmationModel reservationConfirmation;
  @JsonKey(required: true)
  final PlaceOpeningHoursModel openingHours;

  PlaceSettingsModel({required this.placeId, required this.placeName, required this.reservationLogic, required this.reservationChat, required this.reservationConfirmation, required this.openingHours});

  factory PlaceSettingsModel.fromJson(String placeId, Map<String, dynamic> json) => _$PlaceSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceSettingsModelToJson(this);

}