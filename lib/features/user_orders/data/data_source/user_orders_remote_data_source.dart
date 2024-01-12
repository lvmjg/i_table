import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/features/user_orders/data/model/place_order_model.dart';

abstract class UserOrdersRemoteDataSource {
  Stream<List<PlaceOrderModel>> fetchUserOrders(
      String userId, String? reservationId);
}

class UserOrdersRemoteDataSourceImpl implements UserOrdersRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Stream<List<PlaceOrderModel>> fetchUserOrders(
      String userId, String? reservationId) {
    try {
      return fds.fetchOrders(userId: userId, reservationId: reservationId);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
