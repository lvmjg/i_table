import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/place_order/data/model/place_order_model.dart';
import '../../../../core/place_order/domain/entity/place_order.dart';
import '../../../../core/place_order/domain/entity/place_orders_factory.dart';
import '../data_source/service_orders_remote_data_source.dart';

abstract class ServiceOrdersRepository {
  Either<Failure, Stream<List<PlaceOrder>>> fetchServiceOrders(String placeId);
}

class ServiceOrdersRepositoryImpl implements ServiceOrdersRepository {
  final ServiceOrdersRemoteDataSource remote;
  final PlaceOrdersFactory placeOrdersFactory;

  ServiceOrdersRepositoryImpl(this.remote, this.placeOrdersFactory);

  @override
  Either<Failure, Stream<List<PlaceOrder>>> fetchServiceOrders(String placeId) {
    try {
      Stream<List<PlaceOrderModel>> serviceOrdersModelsStream =
          remote.fetchServiceOrders(placeId);

      Stream<List<PlaceOrder>> serviceOrdersStream = serviceOrdersModelsStream
          .map((event) => placeOrdersFactory.getPlaceOrders(event));

      return Right(serviceOrdersStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
