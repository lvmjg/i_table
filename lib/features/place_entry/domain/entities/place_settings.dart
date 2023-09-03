import 'package:i_table/features/place_entry/domain/entities/reservation_chat.dart';
import 'package:i_table/features/place_entry/domain/entities/reservation_confirmation.dart';
import 'package:i_table/features/place_entry/domain/entities/reservation_logic.dart';

import 'place_opening_hours.dart';

class PlaceSettings{
  final String placeId;
  final String placeName;
  final ReservationLogic reservationLogic;
  final ReservationChat reservationChat;
  final ReservationConfirmation reservationConfirmation;
  final PlaceOpeningHours openingHours;

  PlaceSettings({required this.placeId, required this.placeName, required this.reservationLogic, required this.reservationChat, required this.reservationConfirmation, required this.openingHours});
}