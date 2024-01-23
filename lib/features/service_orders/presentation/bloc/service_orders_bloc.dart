import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/service_orders/domain/usecase/update_service_order_status.dart';
import 'package:i_table/features/user_orders/presentation/bloc/user_orders_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/place_order/domain/entity/place_order.dart';
import '../../../../core/place_order/domain/entity/place_orders_factory.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/widget/common_page.dart';
import '../../data/data_source/service_orders_remote_data_source.dart';
import '../../data/repository/service_orders_repository.dart';

part 'service_orders_event.dart';
part 'service_orders_state.dart';

mixin ServiceTodaysUncompletedOrdersBloc on Bloc<ServiceOrdersEvent, ServiceOrdersState> {}

mixin ServiceTodaysCompletedOrdersBloc on Bloc<ServiceOrdersEvent, ServiceOrdersState> {}

mixin ServiceTomorrowsUncompletedOrdersBloc on Bloc<ServiceOrdersEvent, ServiceOrdersState> {}

class ServiceOrdersBloc extends Bloc<ServiceOrdersEvent, ServiceOrdersState> with ServiceTodaysUncompletedOrdersBloc, ServiceTodaysCompletedOrdersBloc, ServiceTomorrowsUncompletedOrdersBloc {
  ServiceOrdersRepository repository = ServiceOrdersRepositoryImpl(ServiceOrdersRemoteDataSourceImpl(),
      PlaceOrdersFactory());

  Stream<List<PlaceOrder>>? serviceOrdersStream;

  ServiceOrdersBloc({required UseCaseSync<Stream<List<PlaceOrder>>, PlaceIdParams> fetchUseCase}) : super(ServiceOrdersFetchInProgress()) {
    UpdateServiceOrderStatus changeServiceOrderStatus = UpdateServiceOrderStatus(repository);

    on<ServiceOrdersInitiated>((event, emit) async {
      emit(ServiceOrdersFetchInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      fetchUseCase(PlaceIdParams(placeId: event.placeId)).fold(
          (failure) => emit(ServiceOrdersFetchFailure(
              params: ErrorParams(errorMessage: errorFetchData))),
          (newServiceOrdersStream) =>
              serviceOrdersStream = newServiceOrdersStream);

      await _handleStream(emit);
    }, transformer: restartable());

    on<ServiceOrderUpdateStatus>((event, emit) async {
      emit(ServiceOrdersFetchSuccess(orders: repository.orders, inTouchMode: false));

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      Either result = await changeServiceOrderStatus(event.params);
      if(result.isLeft()){
        emit(ServiceOrderUpdateStatusFailure(failure: errorUpdateOrderStatus));
        emit(ServiceOrdersFetchSuccess(orders: repository.orders, inTouchMode: true));
      }
    }, transformer: restartable());
  }

  Future<void> _handleStream(Emitter<ServiceOrdersState> emit) async {
    if (serviceOrdersStream != null) {
      await emit.forEach(serviceOrdersStream!,
          onData: (List<PlaceOrder> serviceOrders) {
            serviceOrders
                .sort((a, b) => a.createDate.compareTo(b.createDate) * -1);
            return ServiceOrdersFetchSuccess(orders: serviceOrders, inTouchMode: true);
          },
          onError: (e, s){
            return ServiceOrdersFetchFailure(
                params: ErrorParams(errorMessage: errorFetchData));
          }
          );
    }
  }

}
