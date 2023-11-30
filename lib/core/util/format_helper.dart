import 'package:intl/intl.dart';

class FormatHelper{

  static String formatPrice(double price){
    NumberFormat nf = NumberFormat("####.00", "en_US");
    return nf.format(price);
  }
}