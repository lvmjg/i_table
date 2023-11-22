import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

extension StringFormatExtension on String {
  String format(dynamic arguments) => sprintf(this, arguments);
}

extension DateTimeExtension on DateTime {
  bool isAfterOrEqual(DateTime other) {
    return isAtSameMomentAs(other) || isAfter(other);
  }

  bool isBeforeOrEqual(DateTime other) {
    return isAtSameMomentAs(other) || isBefore(other);
  }

  bool isBetween({required DateTime from, required DateTime to}) {
    return isAfterOrEqual(from) && isBeforeOrEqual(to);
  }

  bool isBetweenExclusive({required DateTime from, required DateTime to}) {
    return isAfter(from) && isBefore(to);
  }

  bool isNotAtTheSameMomentAs(DateTime other) {
    return !isAtSameMomentAs(other);
  }

  DateTime withTime(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  TimeOfDay onlyTime() {
    return TimeOfDay(hour: hour, minute: minute);
  }

  DateTime onlyDate() {
    return DateTime(year, month, day);
  }
}

extension TimeOfDayExtension on TimeOfDay {
  isAfter(TimeOfDay other) {
    int minutes = hour * 60 + minute;
    int otherMinutes = other.hour * 60 + other.minute;
    return minutes > otherMinutes;
  }

  isAfterOrEqual(TimeOfDay other) {
    int minutes = hour * 60 + minute;
    int otherMinutes = other.hour * 60 + other.minute;
    return minutes >= otherMinutes;
  }

  isBefore(TimeOfDay other) {
    int minutes = hour * 60 + minute;
    int otherMinutes = other.hour * 60 + other.minute;
    return minutes < otherMinutes;
  }

  isBeforeOrEqual(TimeOfDay other) {
    int minutes = hour * 60 + minute;
    int otherMinutes = other.hour * 60 + other.minute;
    return minutes <= otherMinutes;
  }

  bool isBetween({required TimeOfDay from, required TimeOfDay to}) {
    return isAfterOrEqual(from) && isBeforeOrEqual(to);
  }

  bool isBetweenExclusive({required TimeOfDay from, required TimeOfDay to}) {
    return isAfter(from) && isBefore(to);
  }

  bool isAtTheSameMomentAs(DateTime other) {
    int minutes = hour * 60 + minute;
    int otherMinutes = other.hour * 60 + other.minute;
    return minutes == otherMinutes;
  }

  bool isNotAtTheSameMomentAs(DateTime other) {
    return !isAtTheSameMomentAs(other);
  }
}

extension DateTimeRangeExtension on DateTimeRange {
  bool contains(DateTime other) {
    return other.isBetween(from: start, to: end);
  }

  bool containsExclusive(DateTime other) {
    return other.isBetweenExclusive(from: start, to: end);
  }

  bool overlapWith(DateTimeRange other) {
    if (other.end.isBeforeOrEqual(start) || other.start.isAfterOrEqual(end)) {
      return false;
    } else {
      return true;
    }
  }

  bool containsExclusiveEnd(DateTime other) {
    return other.isAfterOrEqual(start) && other.isBefore(end);
  }
}
