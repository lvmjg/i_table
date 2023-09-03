import 'package:flutter/material.dart';
import 'package:i_table/features/place_entry/data/models/place_settings/place_settings_model.dart';
import 'package:i_table/features/place_entry/domain/entities/place_settings.dart';
import 'package:i_table/features/place_entry/domain/entities/place_work_day.dart';
import 'package:i_table/features/place_entry/domain/entities/reservation_chat.dart';
import 'package:i_table/features/place_entry/domain/entities/reservation_confirmation.dart';
import 'package:i_table/features/place_entry/domain/entities/reservation_logic.dart';
import 'package:i_table/features/place_entry/domain/entities/time_restricted_reservation.dart';
import 'package:i_table/features/place_entry/domain/entities/time_unlimited_reservation.dart';

import 'place_opening_hours.dart';

class PlaceSettingsFactory {
  PlaceSettings getPlaceSettingsFromModel(PlaceSettingsModel model) {
    return PlaceSettings(
        placeId: model.placeId,
        placeName: model.placeName,
        reservationLogic: ReservationLogic(
          reservationMode: model.reservationLogic.reservationMode,
          maxNumberOfReservationsPerUser:
              model.reservationLogic.maxNumberOfReservationsPerUser,
          maxNumberOfSittingsPerUser:
              model.reservationLogic.maxNumberOfSittingsPerUser,
          reservationInterval: model.reservationLogic.reservationInterval,
          reservationDaysAhead: model.reservationLogic.reservationDaysAhead,
          timeRestrictedReservation: TimeRestrictedReservation(
            minReservationDuration: model.reservationLogic
                .timeRestrictedReservation.minReservationDuration,
            maxReservationDuration: model.reservationLogic
                .timeRestrictedReservation.maxReservationDuration,
            reservationDefaultDuration: model.reservationLogic
                .timeRestrictedReservation.reservationDefaultDuration,
            reservationDurationInterval: model.reservationLogic
                .timeRestrictedReservation.reservationDurationInterval,
          ),
          timeUnlimitedReservation: TimeUnlimitedReservation(
              canReserveBeforeAnotherReservation: model.reservationLogic
                  .timeUnlimitedReservation.canReserveBeforeAnotherReservation,
              reserveBeforeAnotherReservationInterval: model
                  .reservationLogic
                  .timeUnlimitedReservation
                  .reserveBeforeAnotherReservationInterval),
        ),
        reservationChat: ReservationChat(
            chatEnabled: model.reservationChat.chatEnabled,
            maxNumberOfMessages: model.reservationChat.maxNumberOfMessages),
        reservationConfirmation: ReservationConfirmation(
            confirmationEnabled:
                model.reservationConfirmation.confirmationEnabled,
            confirmBeforeDays: model.reservationConfirmation.confirmBeforeDays,
            informBeforeDays: model.reservationConfirmation.informBeforeDays),
        openingHours: PlaceOpeningHours(
            monday: PlaceWorkDay(
                open: _convertToTimeOfDay(model.openingHours.monday.open),
                close: _convertToTimeOfDay(model.openingHours.monday.close)),
            tuesday: PlaceWorkDay(
                open: _convertToTimeOfDay(model.openingHours.tuesday.open),
                close: _convertToTimeOfDay(model.openingHours.tuesday.close)),
            wednesday: PlaceWorkDay(
                open: _convertToTimeOfDay(model.openingHours.wednesday.open),
                close: _convertToTimeOfDay(model.openingHours.wednesday.close)),
            thursday: PlaceWorkDay(
                open: _convertToTimeOfDay(model.openingHours.thursday.open),
                close: _convertToTimeOfDay(model.openingHours.thursday.close)),
            friday: PlaceWorkDay(
                open: _convertToTimeOfDay(model.openingHours.friday.open),
                close: _convertToTimeOfDay(model.openingHours.friday.close)),
            saturday: PlaceWorkDay(
                open: _convertToTimeOfDay(model.openingHours.saturday.open),
                close: _convertToTimeOfDay(model.openingHours.saturday.close)),
            sunday: PlaceWorkDay(
                open: _convertToTimeOfDay(model.openingHours.sunday.open),
                close: _convertToTimeOfDay(model.openingHours.sunday.close))));
  }

  TimeOfDay _convertToTimeOfDay(String time) {
    String hour = time.split(":")[0];
    String minute = time.split(":")[1];
    return TimeOfDay(hour: int.parse(hour), minute: int.parse(minute));
  }
}
