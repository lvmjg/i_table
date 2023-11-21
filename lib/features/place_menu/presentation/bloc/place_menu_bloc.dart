import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/features/place_menu/domain/usecase/submit_order.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_messages_factory.dart';
import 'package:i_table/features/user_orders/domain/entity/place_orders_factory.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/globals.dart';
import '../../data/data_source/place_menu_remote_data_source.dart';
import '../../data/repository/place_menu_repository.dart';
import '../../domain/entity/place_menu.dart';
import '../../domain/entity/place_menu_factory.dart';
import '../../domain/entity/place_menu_item.dart';
import '../../domain/usecase/fetch_place_menu.dart';

part 'place_menu_event.dart';

part 'place_menu_state.dart';

class PlaceMenuBloc extends Bloc<PlaceMenuEvent, PlaceMenuState> {
  PlaceMenuBloc() : super(PlaceMenuFetchInProgress()) {
    FetchPlaceMenu fetchPlaceMenu = FetchPlaceMenu(PlaceMenuRepositoryImpl(
        PlaceMenuRemoteDataSourceImpl(), PlaceMenuFactory(), PlaceOrdersFactory(), ChatMessagesFactory()));

    SubmitOrder submitOrder = SubmitOrder(PlaceMenuRepositoryImpl(
        PlaceMenuRemoteDataSourceImpl(), PlaceMenuFactory(), PlaceOrdersFactory(), ChatMessagesFactory()));

    late String placeId;
    late String placeName;
    late PlaceMenu placeMenu;

    String? userId;
    String? reservationId;

    on<PlaceMenuInitiated>((event, emit) async {
      emit(PlaceMenuFetchInProgress());

      if(debug){
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      (await fetchPlaceMenu(PlaceIdParams(placeId: event.placeId))).fold(
              (failure) =>
              emit(PlaceMenuFetchFailure(errorMessage: errorFetchPlaceMenu)),
              (newPlaceMenu) {
            placeId = event.placeId;
            placeName = event.placeName;
            placeMenu = newPlaceMenu;

            userId = event.userId;
            reservationId = event.reservationId;

            emit(PlaceMenuFetchSuccess(placeId: event.placeId, placeMenu: newPlaceMenu, basket: [], basketTotal: StringUtil.EMPTY));
          });
    });

    on<PlaceMenuItemAdded>((event, emit) async {
      PlaceMenuItem item = placeMenu.placeMenuCategories
          .where((category) => category.name == event.menuItemCategory)
          .toList()
          .first
          .items
          .where((item) => item.id == event.menuItemId)
          .toList()
          .first;

      item.quantity++;

      emit(PlaceMenuFetchSuccess(placeId: placeId, placeMenu: placeMenu, basket: _createBasket(placeMenu), basketTotal: _basketTotal(placeMenu)));
    });

    on<PlaceMenuItemSubstracted>((event, emit) async {
      PlaceMenuItem item = placeMenu.placeMenuCategories
          .where((category) => category.name == event.menuItemCategory)
          .toList()
          .first
          .items
          .where((item) => item.id == event.menuItemId)
          .toList()
          .first;

      item.quantity--;

      emit(PlaceMenuFetchSuccess(placeId: placeId, placeMenu: placeMenu, basket: _createBasket(placeMenu), basketTotal: _basketTotal(placeMenu)));
    });

    on<PlaceMenuItemRemoved>((event, emit) async {
      PlaceMenuItem item = placeMenu.placeMenuCategories
          .where((category) => category.name == event.menuItemCategory)
          .toList()
          .first
          .items
          .where((item) => item.id == event.menuItemId)
          .toList()
          .first;

      item.quantity = 0;

      emit(PlaceMenuFetchSuccess(placeId: placeId, placeMenu: placeMenu, basket: _createBasket(placeMenu), basketTotal: _basketTotal(placeMenu)));
    });

    on<PlaceMenuPayLaterChosen>((event, emit) async {
      emit(PlaceMenuSubmitOrderInProgress());

      if(debug){
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      (await submitOrder(PlaceMenuOrderParams(userId: userId!, placeId: placeId, placeName: placeName, reservationId: reservationId!, placeMenuItems: _createBasket(placeMenu))))
          .fold(
              (failure) => emit(PlaceMenuSubmitOrderFailure(
              errorMessage: errorFetchData)),
              (nothing) => emit(PlaceMenuSubmitOrderSuccess()));
    });
  }
  
  List<PlaceMenuItem> _createBasket(PlaceMenu placeMenu){
    List<PlaceMenuItem> basket = [];
    
    for (var category in placeMenu.placeMenuCategories) {
      for (var item in category.items) {
        if(item.quantity!=0){
          basket.add(item);
        }
      }
    }
    
    return basket;
  }

  String _basketTotal(PlaceMenu placeMenu){
    double total = 0;

    for (var category in placeMenu.placeMenuCategories) {
      for (var item in category.items) {
        if(item.quantity!=0){
          total += item.quantity * item.price;
        }
      }
    }

    if(total!=0){
      NumberFormat nf = NumberFormat("####.00", "en_US");
      return nf.format(total);
    }
    else {
      return StringUtil.EMPTY;
    }
  }
}
