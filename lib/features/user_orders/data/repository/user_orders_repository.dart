import 'package:dartz/dartz.dart';
import 'package:i_table/features/user_orders/data/model/place_order_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/place_order.dart';
import '../../domain/entity/place_orders_factory.dart';
import '../data_source/user_orders_remote_data_source.dart';

abstract class UserOrdersRepository {
  Future<Either<Failure, List<PlaceOrder>>> fetchUserOrders(String userId, String reservationId);
}

class UserOrdersRepositoryImpl implements UserOrdersRepository {
  final UserOrdersRemoteDataSource remote;
  final PlaceOrdersFactory placeOrdersFactory;

  UserOrdersRepositoryImpl(this.remote, this.placeOrdersFactory);

  @override
  Future<Either<Failure, List<PlaceOrder>>> fetchUserOrders(
      String userId, String reservationId) async {
    try {
      List<PlaceOrderModel> placeOrderModels =
          await remote.fetchUserOrders(userId, reservationId);

      if (placeOrderModels.isNotEmpty) {
        return Right(placeOrdersFactory.getPlaceOrders(placeOrderModels));
      } else {
        return Left(FetchFailure());
      }
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
