import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_table/core/extension/extension.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/features/place_entry/domain/entities/place_settings.dart';
import 'package:i_table/features/place_entry/domain/entities/place_work_day.dart';
import 'package:i_table/features/reservation_picker/data/entities/reservation_picker_data.dart';

import '../../../../core/util/globals.dart';

class ReservationPickerDataManager {
  late PlaceSettings placeSettings;

  late DateTime firstDate;
  late DateTime lastDate;
  late DateTime reservationDateTime;

  late Duration minDuration;
  late Duration maxDuration;
  late Duration reservationDuration;
  late List<Duration> acceptableDurations;

  late int reservationDaysAhead;
  late int reservationIntervalMinutes;

  late String error;
  late String todaysWorkingHours;
  late String tomorrowsWorkingHours;

  ReservationPickerDataManager(this.placeSettings) {
    initDate();
    initTime();
    initDuration();

    error = StringUtil.EMPTY;
    todaysWorkingHours = StringUtil.EMPTY;
    tomorrowsWorkingHours = StringUtil.EMPTY;
  }

  void initDate() {
    reservationDaysAhead = placeSettings.reservationLogic.reservationDaysAhead;
    reservationIntervalMinutes =
        placeSettings.reservationLogic.reservationInterval % 60;

    firstDate = DateTime.now();
    reservationDateTime = firstDate;
    lastDate = reservationDateTime.add(Duration(days: reservationDaysAhead));

    _formatWorkingHours();
  }

  void initTime() {
    _setReservationTimeToStartWorkingHours();
  }

  void initDuration() {
    Duration defaultDuration = fromMinutes(placeSettings
        .reservationLogic.timeRestrictedReservation.reservationDefaultDuration);
    reservationDuration = defaultDuration;

    minDuration = fromMinutes(placeSettings
        .reservationLogic.timeRestrictedReservation.minReservationDuration);
    maxDuration = fromMinutes(placeSettings
        .reservationLogic.timeRestrictedReservation.maxReservationDuration);
    Duration durationInterval = fromMinutes(placeSettings.reservationLogic
        .timeRestrictedReservation.reservationDurationInterval);

    acceptableDurations = [];
    acceptableDurations.add(minDuration);
    acceptableDurations.add(maxDuration);

    //Add durations between min and max duration
    Duration tempDuration = minDuration;
    while (tempDuration.inMinutes + durationInterval.inMinutes <
        maxDuration.inMinutes) {
      tempDuration = Duration(
          minutes: tempDuration.inMinutes + durationInterval.inMinutes);
      acceptableDurations.add(tempDuration);
    }

    acceptableDurations.sort((a, b) {
      if (a.inMinutes < b.inMinutes) {
        return -1;
      } else if (a.inMinutes > b.inMinutes) {
        return 1;
      } else {
        return 0;
      }
    });
  }

  Duration fromMinutes(int minutesTotal) {
    int hours = minutesTotal ~/ 60;
    int minutes = minutesTotal % 60;
    return Duration(hours: hours, minutes: minutes);
  }

  ReservationPickerData get data {
    return ReservationPickerData(
        firstDate: firstDate,
        lastDate: lastDate,
        reservationDateTime: reservationDateTime,
        reservationDuration: reservationDuration,
        acceptableDurations: acceptableDurations,
        error: error,
        todaysWorkingHours: todaysWorkingHours,
        tomorrowsWorkingHours: tomorrowsWorkingHours);
  }

  void decreaseDate() {
    clearError();

    if (_tryDecreaseDate()) {
      _setReservationTimeToStartWorkingHours();
    }
  }

  bool _tryDecreaseDate() {
    DateTime newDate = reservationDateTime.subtract(const Duration(days: 1));

    if (newDate.isAfterOrEqual(firstDate)) {
      reservationDateTime = newDate;
      _formatWorkingHours();
      return true;
    } else {
      error = errorPickedDateBefore;
      return false;
    }
  }

  void _setReservationTimeToStartWorkingHours() {
    PlaceWorkDay workDay = getPlaceWorkDay(reservationDateTime.weekday);
    TimeOfDay reservationTime =
    TimeOfDay(hour: workDay.open.hour, minute: workDay.open.minute);

    reservationDateTime = reservationDateTime.withTime(reservationTime);
  }

/*  void _setReservationTimeToStartWorkingHours() {
    PlaceWorkDay workDay = getPlaceWorkDay(reservationDateTime.weekday);
    TimeOfDay reservationTime =
        TimeOfDay(hour: workDay.open.hour, minute: workDay.open.minute);

    reservationDateTime = reservationDateTime.withTime(reservationTime);
  }*/

  void _formatWorkingHours() {
    todaysWorkingHours = _formatWorkingHoursForWeekday(reservationDateTime.weekday);
    tomorrowsWorkingHours = _formatWorkingHoursForWeekday(reservationDateTime.weekday+1);
  }

  String _formatWorkingHoursForWeekday(int weekday){
    StringBuffer hoursBuffer = StringBuffer();

    DateTimeRange samePartHours =
    _getRealWorkingHours(weekday);

    hoursBuffer.write("%0.2d:%0.2d-%0.2d:%0.2d".format([
      samePartHours.start.hour,
      samePartHours.start.minute,
      samePartHours.end.hour,
      samePartHours.end.minute
    ]));

    if(hoursBuffer.isEmpty){
      hoursBuffer.write(placeClosed);
    }

    return hoursBuffer.toString();
  }

  bool _isPlaceWorking(int day) {
    PlaceWorkDay workDay = getPlaceWorkDay(day);
    return (workDay.open.hour != 0 || workDay.open.minute != 0) ||
        (workDay.close.hour != 0 || workDay.close.minute != 0);
  }

  void increaseDate() {
    clearError();

    if (_tryIncreaseDate()) {
      _setReservationTimeToStartWorkingHours();
    }
  }

  bool _tryIncreaseDate() {
    DateTime newDate = reservationDateTime.add(const Duration(days: 1));

    if (newDate.isBeforeOrEqual(lastDate)) {
      reservationDateTime = newDate;
      _formatWorkingHours();
      return true;
    } else {
      error = errorPickedDateAfter.format([reservationDaysAhead]);
      return false;
    }
  }

  void setDate(DateTime newDate) {
    clearError();

    if (newDate.isNotAtTheSameMomentAs(reservationDateTime)) {
      reservationDateTime = newDate;
      _setReservationTimeToStartWorkingHours();
    }
  }

  void decreaseTime() {
    clearError();

    if(_isPlaceWorking(reservationDateTime.weekday)) {
      DateTime desiredDateTime =
      reservationDateTime.subtract(
          Duration(minutes: reservationIntervalMinutes));

      bool isReservationDateToday = reservationDateTime.onlyDate()
          .isAtSameMomentAs(DateTime.now().onlyDate());
      if (isReservationDateToday) {
        bool isChosenTimeBeforeCurrentTime = desiredDateTime.onlyTime()
            .isBefore(DateTime.now().onlyTime());
        if (isChosenTimeBeforeCurrentTime) {
          error = errorPickedDateBefore;
        }
        else {
          _adjustTimeToWorkingHoursAndReservationDuration(
              desiredDateTime, reservationDuration);
        }
      }
      else {
        _adjustTimeToWorkingHoursAndReservationDuration(
            desiredDateTime, reservationDuration);
      }
    }
  }

  bool _adjustTimeToWorkingHoursAndReservationDuration(DateTime desiredDateTime, Duration desiredDuration) {
    DateTimeRange croppedWorkingHours = _getRealWorkingHours(desiredDateTime.weekday);
    if (croppedWorkingHours.contains(desiredDateTime)) {
      DateTime reservationEnd = desiredDateTime.add(reservationDuration);
      DateTimeRange workingHours = _getRealWorkingHours(desiredDateTime.weekday);

      if (workingHours.contains(reservationEnd)) {
        reservationDuration = desiredDuration;
        reservationDateTime = reservationDateTime.withTime(desiredDateTime.onlyTime());
        return true;
      } else {
        error =
        "Koniec rezerwacji wypada poza godzinami pracy punktu.\nWybierz inną godzinę lub zmniejsz czas trwania rezerwacji.";
        return false;
      }

    } else {
      error =
      "Godzina rozpoczęcia rezerwacji wypada poza godzinami pracy punktu: $todaysWorkingHours.\n\nWybierz inną godzinę";
      return false;
    }
  }

  void increaseTime() {
    clearError();

    if(_isPlaceWorking(reservationDateTime.weekday)) {
      DateTime desiredDateTime =
      reservationDateTime.add(Duration(minutes: reservationIntervalMinutes));
      _adjustTimeToWorkingHoursAndReservationDuration(
          desiredDateTime, reservationDuration);
    }
  }

  void setTime(TimeOfDay newTime) {
    clearError();

    int newMinutes = ((newTime.minute ~/ reservationIntervalMinutes) *
            reservationIntervalMinutes) %
        60;

    TimeOfDay newTimeAdjusted =
        TimeOfDay(hour: newTime.hour, minute: newMinutes);

    _adjustTimeToWorkingHoursAndReservationDuration(
        reservationDateTime.withTime(newTimeAdjusted), reservationDuration);
  }

  void setDuration(Duration newDuration) {
    if (_isPlaceWorking(reservationDateTime.weekday) && newDuration.inMinutes >= minDuration.inMinutes &&
        newDuration.inMinutes <= maxDuration.inMinutes) {

      _adjustTimeToWorkingHoursAndReservationDuration(reservationDateTime, newDuration);
    }
  }

  DateTimeRange _getRealWorkingHours(int weekday) {
    int adjustedWeekday = _correctWeekday(weekday);

    PlaceWorkDay workingDay = getPlaceWorkDay(adjustedWeekday);
    DateTime openTime = DateTime(reservationDateTime.year, reservationDateTime.month,
        reservationDateTime.day, workingDay.open.hour, workingDay.open.minute);

    DateTime closeTime = DateTime(reservationDateTime.year, reservationDateTime.month,
        reservationDateTime.day, workingDay.close.hour, workingDay.close.minute);

    return DateTimeRange(start: openTime, end: closeTime);
  }

  int _correctWeekday(int weekday) {
    if(weekday == 0){
      return 7;
    }
    else if(weekday == 8){
      return 1;
    }
    else {
      return weekday;
    }
  }

  PlaceWorkDay getPlaceWorkDay(int day) {
    if (day == 1) {
      return placeSettings.openingHours.monday;
    } else if (day == 2) {
      return placeSettings.openingHours.tuesday;
    } else if (day == 3) {
      return placeSettings.openingHours.wednesday;
    } else if (day == 4) {
      return placeSettings.openingHours.thursday;
    } else if (day == 5) {
      return placeSettings.openingHours.friday;
    } else if (day == 6) {
      return placeSettings.openingHours.saturday;
    } else if (day == 7) {
      return placeSettings.openingHours.sunday;
    } else {
      return placeSettings.openingHours.monday;
    }
  }

  void clearError(){
    error = StringUtil.EMPTY;
  }
}
