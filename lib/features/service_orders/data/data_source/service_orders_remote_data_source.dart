import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../../core/place_order/data/model/place_order_model.dart';

abstract class ServiceOrdersRemoteDataSource {
  Stream<List<PlaceOrderModel>> fetchServiceOrders(String placeId, DateTime mealDate);
  Future<void> updateStatus(OrderUpdateStatusParams params);
}

class ServiceOrdersRemoteDataSourceImpl
    implements ServiceOrdersRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Stream<List<PlaceOrderModel>> fetchServiceOrders(String placeId, DateTime mealDate) {
    try {
      return fds.fetchServiceOrders(placeId: placeId, mealDate: mealDate);
    } catch (e, s) {
      throw FetchException();
    }
  }

  @override
  Future<void> updateStatus(OrderUpdateStatusParams params) async {
    try {
      return await fds.updateServiceOrderStatus(params.orderId, params.newStatus);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
