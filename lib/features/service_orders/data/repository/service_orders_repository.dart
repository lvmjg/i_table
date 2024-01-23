import 'package:dartz/dartz.dart';
import 'package:i_table/core/extension/extension.dart';
import 'package:i_table/core/place_order/data/model/order_status.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/features/service_orders/domain/usecase/update_service_order_status.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/place_order/data/model/place_order_model.dart';
import '../../../../core/place_order/domain/entity/place_order.dart';
import '../../../../core/place_order/domain/entity/place_orders_factory.dart';
import '../data_source/service_orders_remote_data_source.dart';

abstract class ServiceOrdersRepository {
  List<PlaceOrder> orders = [];
  Either<Failure, Stream<List<PlaceOrder>>> fetchTodaysServiceOrders(String placeId, {required bool filterCompleted});
  Either<Failure, Stream<List<PlaceOrder>>> fetchTomorrowsServiceOrders(String placeId, {required bool filterCompleted});
  Future<Either<Failure, void>> updateStatus(OrderUpdateStatusParams params);
}

class ServiceOrdersRepositoryImpl implements ServiceOrdersRepository {
  final ServiceOrdersRemoteDataSource remote;
  final PlaceOrdersFactory placeOrdersFactory;

  ServiceOrdersRepositoryImpl(this.remote, this.placeOrdersFactory);

  @override
  List<PlaceOrder> orders = [];

  @override
  Either<Failure, Stream<List<PlaceOrder>>> fetchTodaysServiceOrders(String placeId, {required bool filterCompleted}) {
    try {
      Stream<List<PlaceOrderModel>> serviceOrdersModelsStream =
          remote.fetchServiceOrders(placeId, DateTime.now().onlyDate());

      Stream<List<PlaceOrder>> serviceOrdersStream = serviceOrdersModelsStream
          .map((event) {
            orders = placeOrdersFactory.getPlaceOrders(event);

            if(filterCompleted){
              orders = _filterCompleted(orders);
            }
            else{
             orders = _filterUncompleted(orders);
            }

            return orders;
          });

      return Right(serviceOrdersStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }

  @override
  Either<Failure, Stream<List<PlaceOrder>>> fetchTomorrowsServiceOrders(String placeId, {required bool filterCompleted}) {
    try {
      Stream<List<PlaceOrderModel>> serviceOrdersModelsStream =
      remote.fetchServiceOrders(placeId, DateTime.now().onlyDate().add(const Duration(days: 1)));

      Stream<List<PlaceOrder>> serviceOrdersStream = serviceOrdersModelsStream
          .map((event) {
        orders = placeOrdersFactory.getPlaceOrders(event);

        if(filterCompleted){
          orders = _filterCompleted(orders);
        }
        else{
          orders = _filterUncompleted(orders);
        }

        return orders;
      });

      return Right(serviceOrdersStream);
    } on FetchException {
      return Left(FetchFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateStatus(OrderUpdateStatusParams params) async {
    try {
      await remote.updateStatus(params);
      return Right(null);
    } on FetchException {
      return Left(FetchFailure());
    }
  }

  List<PlaceOrder> _filterCompleted(List<PlaceOrder> orders){
    return orders.where((element) => element.status == OrderStatus.cancelled.name || element.status == OrderStatus.ready.name).toList();
  }

  List<PlaceOrder> _filterUncompleted(List<PlaceOrder> orders){
    return orders.where((element) => element.status == OrderStatus.pending.name || element.status == OrderStatus.confirmed.name).toList();
  }
}
