import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/place_order/data/model/place_order_model.dart';
import '../../../../core/place_order/domain/entity/place_order.dart';
import '../../../../core/place_order/domain/entity/place_orders_factory.dart';
import '../data_source/user_orders_remote_data_source.dart';

abstract class UserOrdersRepository {
  Either<Failure, Stream<List<PlaceOrder>>> fetchUserOrders(
      String params);
}

class UserAllOrdersRepository implements UserOrdersRepository {
  final UserOrdersRemoteDataSource remote;
  final PlaceOrdersFactory ordersFactory;

  UserAllOrdersRepository(this.remote, this.ordersFactory);

  @override
  Either<Failure, Stream<List<PlaceOrder>>> fetchUserOrders(String userId) {
    try {
      Stream<List<PlaceOrderModel>> userOrderModelsStream =
      remote.fetchUserOrders(userId);

      Stream<List<PlaceOrder>> userOrdersStream = userOrderModelsStream
          .map((event) => ordersFactory.getPlaceOrders(event));

      return Right(userOrdersStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}

class UserReservationOrdersRepository implements UserOrdersRepository {
  final UserOrdersRemoteDataSource remote;
  final PlaceOrdersFactory ordersFactory;

  UserReservationOrdersRepository(this.remote, this.ordersFactory);

  @override
  Either<Failure, Stream<List<PlaceOrder>>> fetchUserOrders(String reservationId) {
    try {
      Stream<List<PlaceOrderModel>> reservationOrderModelsStream =
      remote.fetchUserOrders(reservationId);

      Stream<List<PlaceOrder>> reservationOrdersStream = reservationOrderModelsStream
          .map((event) => ordersFactory.getPlaceOrders(event));

      return Right(reservationOrdersStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}