import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/features/user_orders/data/model/place_order_model.dart';

import '../../../../core/util/globals.dart';

abstract class UserOrdersRemoteDataSource {
  Future<List<PlaceOrderModel>> fetchUserOrders(String userId, String reservationId);
}

class UserOrdersRemoteDataSourceImpl implements UserOrdersRemoteDataSource {
  @override
  Future<List<PlaceOrderModel>> fetchUserOrders(String userId, String reservationId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    FirebaseFirestore ff = FirebaseFirestore.instance;

    List<PlaceOrderModel> userOrders;
    try {
      QuerySnapshot<Map<String, dynamic>> userOrdersSnapshot = await ff
          .collection(pathPlacesOrders)
          .where(pathUserId, isEqualTo: userId)
          .where(pathReservationId, isEqualTo: reservationId)
          .get(const GetOptions(source: Source.server));

      userOrders = userOrdersSnapshot.docs
          .map((value) {

            String key = value.id;

       return PlaceOrderModel.fromJson(value.id, value.data());
      }
        )
          .toList();
    } catch (e, s) {
      throw FetchException();
    }

    return userOrders;
  }
}
