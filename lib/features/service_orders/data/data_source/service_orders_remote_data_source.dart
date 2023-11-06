import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/features/user_orders/data/model/place_order_model.dart';

import '../../../../core/util/globals.dart';

abstract class ServiceOrdersRemoteDataSource {
  Stream<List<PlaceOrderModel>> fetchServiceOrders(String placeId);
}

class ServiceOrdersRemoteDataSourceImpl implements ServiceOrdersRemoteDataSource {
  @override
  Stream<List<PlaceOrderModel>> fetchServiceOrders(String placeId) {
    FirebaseFirestore ff = FirebaseFirestore.instance;

    Stream<List<PlaceOrderModel>> serviceOrdersModelsStream = Stream.empty();
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> serviceOrdersSnapshotsStream = ff
          .collection(pathPlacesOrders)
          .where(pathPlaceId, isEqualTo: placeId)
          .snapshots();

      serviceOrdersModelsStream = serviceOrdersSnapshotsStream.map((event) => event.docs
          .map((value) => PlaceOrderModel.fromJson(value.id, value.data()))
          .toList());
    } catch (e, s) {
      throw FetchException();
    }

    return serviceOrdersModelsStream;
  }
}
