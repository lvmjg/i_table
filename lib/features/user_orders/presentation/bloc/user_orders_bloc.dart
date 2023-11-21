import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/user_orders/domain/entity/place_order.dart';
import 'package:i_table/features/user_orders/domain/usecase/fetch_user_orders.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/data_source/user_orders_remote_data_source.dart';
import '../../data/repository/user_orders_repository.dart';
import '../../domain/entity/place_orders_factory.dart';

part 'user_orders_event.dart';
part 'user_orders_state.dart';

class UserOrdersBloc extends Bloc<UserOrdersEvent, UserOrdersState> {
  UserOrdersBloc() : super(UserOrdersFetchInProgress()) {
    FetchUserOrders fetchUserOrders = FetchUserOrders(UserOrdersRepositoryImpl(
        UserOrdersRemoteDataSourceImpl(), PlaceOrdersFactory()));

    on<UserOrdersInitiated>((event, emit) async {
      emit(UserOrdersFetchInProgress());

      if(debug){
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      Stream<List<PlaceOrder>>? userOrdersStream;

      fetchUserOrders(UserOrdersParams(userId: event.params.userId, reservationId: event.params.reservationId)).fold(
          (failure) =>
              emit(UserOrdersFetchFailure(errorMessage: errorFetchData)),
          (newUserOrdersStream) => userOrdersStream = newUserOrdersStream);

      if(userOrdersStream!=null){
        await emit.forEach(userOrdersStream!, onData: (List<PlaceOrder> userOrders){
          userOrders.sort((a,b) => a.orderDateTime.compareTo(b.orderDateTime));
          return UserOrdersFetchSuccess(orders: userOrders);
        });
      }
    }, transformer: restartable());
  }
}
