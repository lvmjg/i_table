import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/user_orders/domain/entity/place_order.dart';
import 'package:i_table/features/user_orders/domain/usecase/fetch_user_orders.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../user_orders/domain/entity/place_orders_factory.dart';
import '../../data/data_source/service_orders_remote_data_source.dart';
import '../../data/repository/service_orders_repository.dart';
import '../../domain/usecase/fetch_service_orders.dart';

part 'service_orders_event.dart';
part 'service_orders_state.dart';

class ServiceOrdersBloc extends Bloc<ServiceOrdersEvent, ServiceOrdersState> {
  ServiceOrdersBloc() : super(ServiceOrdersFetchInProgress()) {
    FetchServiceOrders fetchServiceOrders = FetchServiceOrders(ServiceOrdersRepositoryImpl(
        ServiceOrdersRemoteDataSourceImpl(), PlaceOrdersFactory()));

    on<ServiceOrdersInitiated>((event, emit) async {
      emit(ServiceOrdersFetchInProgress());

      Stream<List<PlaceOrder>>? serviceOrdersStream;

      (await fetchServiceOrders(event.params.placeId)).fold(
          (failure) =>
              emit(ServiceOrdersFetchFailure(errorMessage: errorFetchData)),
          (newServiceOrdersStream) => serviceOrdersStream = newServiceOrdersStream);

      if (serviceOrdersStream != null) {
        await emit.forEach(serviceOrdersStream!,
            onData: (List<PlaceOrder> serviceOrders) {
              serviceOrders.sort((a,b) => a.orderDateTime.compareTo(b.orderDateTime));
              return ServiceOrdersFetchSuccess(orders: serviceOrders);
            });
      }
    }, transformer: restartable());
  }
}
