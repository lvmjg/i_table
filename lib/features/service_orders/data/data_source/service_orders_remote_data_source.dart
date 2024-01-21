import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';

import '../../../../core/place_order/data/model/place_order_model.dart';

abstract class ServiceOrdersRemoteDataSource {
  Stream<List<PlaceOrderModel>> fetchServiceOrders(String placeId);
}

class ServiceOrdersRemoteDataSourceImpl
    implements ServiceOrdersRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Stream<List<PlaceOrderModel>> fetchServiceOrders(String placeId) {
    try {
      return fds.fetchOrders(placeId: placeId);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
