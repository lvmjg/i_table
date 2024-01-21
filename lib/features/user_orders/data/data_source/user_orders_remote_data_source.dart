import '../../../../core/data_source/firebase_data_source.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/place_order/data/model/place_order_model.dart';

abstract class UserOrdersRemoteDataSource {
  Stream<List<PlaceOrderModel>> fetchUserOrders(
      String param);
}

class UserAllOrdersRemoteDataSource implements UserOrdersRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Stream<List<PlaceOrderModel>> fetchUserOrders(
      String userId) {
    try {
      return fds.fetchOrders(userId: userId);
    } catch (e, s) {
      throw FetchException();
    }
  }
}

class UserReservationOrdersRemoteDataSource implements UserOrdersRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Stream<List<PlaceOrderModel>> fetchUserOrders(
      String reservationId) {
    try {
      return fds.fetchOrders(reservationId: reservationId);
    } catch (e, s) {
      throw FetchException();
    }
  }
}