import 'package:flutter/cupertino.dart';
import 'package:i_table/core/extension/extension.dart';
import 'package:i_table/core/util/string_util.dart';

import '../../../../../core/util/globals.dart';

class PlaceReservation {
  final String id;
  final String no;
  final String placeId;
  final String placeName;
  final String placeAddress;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final int duration;
  final int people;
  final String status;
  final Map<String, Map<String, List<String>>> tables;
  final Map<String, List<String>> groups;
  final List<String> sittings;
  final DateTime createDate;
  final DateTime updateDate;
  final String closedBy;

  bool analyzed = false;

  PlaceReservation({
    this.id = StringUtil.EMPTY,
    required this.no,
    required this.placeId,
    required this.placeName,
    required this.placeAddress,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.duration,
    required this.people,
    required this.status,
    required this.tables,
    required this.groups,
    required this.sittings,
    required this.createDate,
    required this.updateDate,
    required this.closedBy
  });

  String get timeRange {
    StringBuffer hoursBuffer = StringBuffer();

    if (duration == 0) {
      hoursBuffer.write('%0.2d:%0.2d'.format([
        startDate.onlyTime().hour,
        startDate.onlyTime().minute,
      ]));

      return '$from ${hoursBuffer.toString()}';
    } else {
      hoursBuffer.write('%0.2d:%0.2d $dash %0.2d:%0.2d'.format([
        startDate.onlyTime().hour,
        startDate.onlyTime().minute,
        endDate.onlyTime().hour,
        endDate.onlyTime().minute
      ]));

      return hoursBuffer.toString();
    }
  }

  String get sittingsSummary {
    StringBuffer buffer = StringBuffer();

    if (tables.isNotEmpty) {
      buffer.write('$table$colon$nl');

      tables.forEach((key, value) {
        buffer.write('$tab$key$colon ');
        bool isWholeTableReserved = value.isEmpty;
        if (isWholeTableReserved == false) {
          buffer.write(nl);
        }

        _writeSittingGroup(buffer, key, value);
      });
    }

    if (groups.isNotEmpty) {
      buffer.write(nl);
      buffer.write('$sittingGroup$colon$nl');

      _writeSittingGroup(buffer, StringUtil.EMPTY, groups);
    }

    if (sittings.isNotEmpty) {
      buffer.write(nl);
      buffer.write('$aloneSittings$colon$nl$tab$tab');

      _writeSittings(buffer, sittings);
    }

    return buffer.toString();
  }

  _writeSittingGroup(
      StringBuffer buffer, String table, Map<String, List<String>> groups) {
    if (groups.entries.isEmpty) {
      buffer.write('$allSittings $nl');
    } else {
      groups.forEach((key, value) {
        if (key != 'default') {
          buffer.write('$tab$tab $key $arrow ');
        }

        buffer.write(sitting);
        buffer.write(lp);

        _writeSittings(buffer, value);

        buffer.write(rp);
        buffer.write(nl);
      });
    }
  }

  _writeSittings(StringBuffer buffer, List<String> sittings) {
    sittings.forEach((element) {
      buffer.write(element);

      if (sittings.last != element) {
        buffer.write('$comma ');
      }
    });
  }
}
