import 'package:flutter/material.dart';

class ReservationPickerData {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime reservationDateTime;

  final Duration reservationDuration;
  final List<Duration> acceptableDurations;

  final String error;
  final String todaysWorkingHours;
  final String tomorrowsWorkingHours;

  ReservationPickerData(
      {required this.firstDate,
      required this.lastDate,
      required this.reservationDateTime,
      required this.reservationDuration,
      required this.acceptableDurations,
      required this.error,
      required this.todaysWorkingHours,
      required this.tomorrowsWorkingHours});
}
