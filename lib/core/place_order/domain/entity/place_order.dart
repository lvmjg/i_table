import 'package:i_table/core/place_order/domain/entity/place_order_item.dart';

import '../../../../core/util/globals.dart';

class PlaceOrder {
  final String? id;
  final String? no;
  final String userId;
  final String? reservationId;
  final String placeId;
  final String placeName;
  final bool status;
  final DateTime orderDateTime;
  final List<PlaceOrderItem> userOrders;
  late final double totalCost;

  PlaceOrder(
      {this.id,
      this.no,
      required this.userId,
      required this.reservationId,
      required this.placeId,
      required this.placeName,
      required this.status,
      required this.orderDateTime,
      required this.userOrders,
      this.totalCost = 0});

  String get summary {
    StringBuffer buffer = StringBuffer();

    buffer.write('$pleasePrepare\n');

    int i = 0;
    userOrders.forEach((element) {
      i++;
      buffer.write('$i. ${element.summary}\n');
    });

    buffer.write('\n$thankYou');

    return buffer.toString();
  }
}
