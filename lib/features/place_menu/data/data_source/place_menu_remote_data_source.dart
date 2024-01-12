import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/features/reservation_chat/data/model/chat_message_model.dart';
import 'package:i_table/features/user_orders/data/model/place_order_model.dart';

import '../../../../core/error/exceptions.dart';
import '../model/place_menu_model.dart';

abstract class PlaceMenuRemoteDataSource {
  Future<PlaceMenuModel?> fetchPlaceMenu(String placeId);
  Future<void> submitOrder(PlaceOrderModel placeOrderModel,
      String? reservationId, ChatMessageModel orderMessageModel);
}

class PlaceMenuRemoteDataSourceImpl implements PlaceMenuRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Future<PlaceMenuModel?> fetchPlaceMenu(String placeId) async {
    try {
      return await fds.fetchPlaceMenu(placeId);
    } catch (e, s) {
      throw FetchException();
    }
  }

  @override
  Future<void> submitOrder(PlaceOrderModel placeOrderModel,
      String? reservationId, ChatMessageModel orderMessageModel) async {
    try {
      await fds.submitOrder(placeOrderModel, reservationId, orderMessageModel);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
