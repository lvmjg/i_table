import 'package:i_table/core/util/format_helper.dart';
import 'package:i_table/core/util/string_util.dart';

class PlaceMenuItem {
  final String id;
  final String category;
  final String name;
  final String description;
  final double price;
  final String? url;
  late int quantity;
  late String note;

  PlaceMenuItem(
      {required this.id,
      required this.category,
      required this.name,
      required this.description,
      required this.price,
      required this.url,
      this.quantity = 0,
      this.note = StringUtil.EMPTY
      });

  String get formattedPrice => FormatHelper.formatPrice(price);
}
