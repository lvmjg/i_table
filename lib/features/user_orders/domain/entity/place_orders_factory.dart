import 'package:i_table/features/user_orders/data/model/place_order_item_model.dart';
import 'package:i_table/features/user_orders/domain/entity/place_order.dart';
import 'package:i_table/features/user_orders/domain/entity/place_order_item.dart';

import '../../data/model/place_order_model.dart';

class PlaceOrdersFactory {
  List<PlaceOrder> getPlaceOrders(List<PlaceOrderModel> placeOrderModels) {
    List<PlaceOrder> placeOrders = [];

    placeOrderModels.forEach((placeOrderModel) {
      List<PlaceOrderItem> placeOrderItems = [];

      placeOrderModel.userOrder.entries.forEach((entry) {
        placeOrderItems.add(PlaceOrderItem(
            id: entry.key,
            category: entry.value.category,
            name: entry.value.name,
            description: entry.value.description,
            price: entry.value.price,
            quantity: entry.value.quantity,
            note: entry.value.note,
            status: entry.value.status,
            cost: entry.value.price * entry.value.quantity));
      });

      double totalCost = placeOrderItems
          .map<double>((e) => e.cost)
          .reduce((v1, v2) => v1 + v2);

      placeOrders.add(PlaceOrder(
          id: placeOrderModel.id,
          no: placeOrderModel.id.substring(0, 6),
          userId: placeOrderModel.userId,
          reservationId: placeOrderModel.reservationId,
          placeId: placeOrderModel.placeId,
          placeName: placeOrderModel.placeName,
          status: placeOrderModel.status,
          orderDateTime: placeOrderModel.orderDT,
          userOrders: placeOrderItems,
          totalCost: totalCost));
    });

    return placeOrders;
  }

  PlaceOrderModel getModelFromPlaceOrder(PlaceOrder placeOrder) {
    Map<String, PlaceOrderItemModel> placeOrderModelsMap = {};

    placeOrder.userOrders.forEach((item) {
      placeOrderModelsMap.putIfAbsent(
          item.id,
          () => PlaceOrderItemModel(
              name: item.name,
              description: item.description,
              category: item.category,
              price: item.price,
              quantity: item.quantity,
              note: item.note,
              status: item.status));
    });

    return PlaceOrderModel(
        userId: placeOrder.userId,
        reservationId: placeOrder.reservationId,
        placeId: placeOrder.placeId,
        placeName: placeOrder.placeName,
        status: placeOrder.status,
        orderDT: placeOrder.orderDateTime,
        userOrder: placeOrderModelsMap);
  }
}
