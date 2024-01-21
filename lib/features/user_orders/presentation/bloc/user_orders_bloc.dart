import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:meta/meta.dart';

import '../../../../core/place_order/domain/entity/place_order.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/widget/common_page.dart';
import '../../domain/usecase/fetch_user_orders.dart';

part 'user_orders_event.dart';
part 'user_orders_state.dart';

mixin UserReservationOrdersBloc on Bloc<UserOrdersEvent, UserOrdersState> {}

mixin UserAllOrdersBloc on Bloc<UserOrdersEvent, UserOrdersState> {}

class UserOrdersBloc extends Bloc<UserOrdersEvent, UserOrdersState> with UserAllOrdersBloc, UserReservationOrdersBloc{
  final FetchUserOrders fetchUserOrders;
  Stream<List<PlaceOrder>>? userOrdersStream;

  UserOrdersBloc({required this.fetchUserOrders}) : super(UserOrdersFetchInProgress()) {
    on<UserOrdersInitiated>((event, emit) async {
      emit(UserOrdersFetchInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      fetchUserOrders(event.userOrReservationId)
          .fold(
              (failure) => emit(UserOrdersFetchFailure(
                  params: ErrorParams(errorMessage: errorFetchData))),
              (newUserOrdersStream) => userOrdersStream = newUserOrdersStream);

      await _handleStream(emit);
    }, transformer: restartable());
  }

  Future<void> _handleStream(Emitter<UserOrdersState> emit) async {
    if (userOrdersStream != null) {
      await emit.forEach(userOrdersStream!,
          onData: (List<PlaceOrder> userOrders) {
            log('Orders new data: ${userOrders.length}');

            userOrders
                .sort((a, b) =>
            a.orderDateTime.compareTo(b.orderDateTime) * -1);
            return UserOrdersFetchSuccess(orders: userOrders);
          },
          onError: (e, s) {
            return UserOrdersFetchFailure(
                params: ErrorParams(errorMessage: errorFetchData));
          }
      );
    }
  }

  Future<bool> _checkStreamForData() async{
    return await Future.delayed(
        Duration(seconds: STREAM_CHECK_TIMEOUT),
        () async {
          bool isStreamEmpty = false;
          if(userOrdersStream==null){
            isStreamEmpty = true;
          }
          else{
            isStreamEmpty = await userOrdersStream!.isEmpty;
          }

          return isStreamEmpty;
        }
    );
  }
}




