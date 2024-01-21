import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:meta/meta.dart';

import '../../../../core/place_order/domain/entity/place_order.dart';
import '../../../../core/place_order/domain/entity/place_orders_factory.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/widget/common_page.dart';
import '../../data/data_source/service_orders_remote_data_source.dart';
import '../../data/repository/service_orders_repository.dart';
import '../../domain/usecase/fetch_service_orders.dart';

part 'service_orders_event.dart';
part 'service_orders_state.dart';

class ServiceOrdersBloc extends Bloc<ServiceOrdersEvent, ServiceOrdersState> {
  ServiceOrdersBloc() : super(ServiceOrdersFetchInProgress()) {
    FetchServiceOrders fetchServiceOrders = FetchServiceOrders(
        ServiceOrdersRepositoryImpl(
            ServiceOrdersRemoteDataSourceImpl(), PlaceOrdersFactory()));

    on<ServiceOrdersInitiated>((event, emit) async {
      emit(ServiceOrdersFetchInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      Stream<List<PlaceOrder>>? serviceOrdersStream;

      fetchServiceOrders(PlaceIdParams(placeId: event.placeId)).fold(
          (failure) => emit(ServiceOrdersFetchFailure(
              params: ErrorParams(errorMessage: errorFetchData))),
          (newServiceOrdersStream) =>
              serviceOrdersStream = newServiceOrdersStream);

      if (serviceOrdersStream != null) {
        await emit.forEach(serviceOrdersStream!,
            onData: (List<PlaceOrder> serviceOrders) {
          serviceOrders
              .sort((a, b) => a.orderDateTime.compareTo(b.orderDateTime) * -1);
          return ServiceOrdersFetchSuccess(orders: serviceOrders);
        });
      }
    }, transformer: restartable());
  }
}
