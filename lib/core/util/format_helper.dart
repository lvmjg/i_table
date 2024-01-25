import 'package:flutter/material.dart';
import 'package:i_table/core/extension/extension.dart';
import 'package:intl/intl.dart';

class FormatHelper{

  static String formatPrice(double price){
    NumberFormat nf = NumberFormat("####.00", "en_US");
    return nf.format(price);
  }

  static String formatTime(TimeOfDay time){
    DateTime dateTime = time.toDate();
    DateFormat format = DateFormat('HH:mm');
    return format.format(dateTime);
  }

}