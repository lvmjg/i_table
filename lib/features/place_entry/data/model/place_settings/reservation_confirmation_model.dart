import 'package:json_annotation/json_annotation.dart';

part 'reservation_confirmation_model.g.dart';

@JsonSerializable()
class ReservationConfirmationModel{
  @JsonKey(defaultValue: true)
  final bool confirmationEnabled;
  @JsonKey(defaultValue: 1)
  final int confirmBeforeDays;
  @JsonKey(defaultValue: 2)
  final int informBeforeDays;

  ReservationConfirmationModel({required this.confirmationEnabled, required this.confirmBeforeDays, required this.informBeforeDays});

  factory ReservationConfirmationModel.fromJson(Map<String, dynamic> json) => _$ReservationConfirmationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationConfirmationModelToJson(this);
}