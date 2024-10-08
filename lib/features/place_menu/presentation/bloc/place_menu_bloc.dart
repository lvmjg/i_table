import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_table/core/extension/extension.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/features/place_menu/domain/usecase/submit_order.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_messages_factory.dart';
import 'package:meta/meta.dart';

import '../../../../core/place_order/domain/entity/place_orders_factory.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/format_helper.dart';
import '../../../../core/util/globals.dart';
import '../../../../core/widget/common_page.dart';
import '../../../../main.dart';
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
        PlaceMenuRemoteDataSourceImpl(),
        PlaceMenuFactory(),
        PlaceOrdersFactory(),
        ChatMessagesFactory()));

    SubmitOrder submitOrder = SubmitOrder(PlaceMenuRepositoryImpl(
        PlaceMenuRemoteDataSourceImpl(),
        PlaceMenuFactory(),
        PlaceOrdersFactory(),
        ChatMessagesFactory()));

    late String placeId;
    late String placeName;
    late PlaceMenu placeMenu;

    String? userId;
    String? reservationId;

    TimeOfDay? mealTime;
    DateTime? mealDate;

    on<PlaceMenuInitiated>((event, emit) async {
      emit(PlaceMenuFetchInProgress());

      if (debug) {
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

        emit(PlaceMenuFetchSuccess(
            placeId: event.placeId,
            placeMenu: newPlaceMenu,
            basket: [],
            basketTotal: StringUtil.EMPTY,
            basketTotalItems: _basketTotalItems(placeMenu)
        ));
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

      emit(PlaceMenuFetchSuccess(
          placeId: placeId,
          placeMenu: placeMenu,
          basket: _createBasket(placeMenu),
          basketTotal: _basketTotal(placeMenu),
          basketTotalItems: _basketTotalItems(placeMenu)
      ));
    });

    on<PlaceMenuItemSubtracted>((event, emit) async {
      PlaceMenuItem item = placeMenu.placeMenuCategories
          .where((category) => category.name == event.menuItemCategory)
          .toList()
          .first
          .items
          .where((item) => item.id == event.menuItemId)
          .toList()
          .first;

      item.quantity--;

      emit(PlaceMenuFetchSuccess(
          placeId: placeId,
          placeMenu: placeMenu,
          basket: _createBasket(placeMenu),
          basketTotal: _basketTotal(placeMenu),
          basketTotalItems: _basketTotalItems(placeMenu)
      ));
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

      emit(PlaceMenuFetchSuccess(
          placeId: placeId,
          placeMenu: placeMenu,
          basket: _createBasket(placeMenu),
          basketTotal: _basketTotal(placeMenu),
          basketTotalItems: _basketTotalItems(placeMenu)
      ));
    });

    on<PlaceMenuMealDateSet>((event, emit) async {
      mealDate = event.mealDate;
    });

    on<PlaceMenuMealTimeSet>((event, emit) async {
      mealTime = event.mealTime;
    });

    on<PlaceMenuPayChosen>((event, emit) async {
      emit(PlaceMenuSubmitOrderInProgress());

      if (debug) {
        await Future.delayed(Duration(seconds: TEST_TIMEOUT));
      }

      double totalCost = double.parse(_basketTotal(placeMenu));
      bool paid = await _pay(totalCost);

      if(paid) {
        (await submitOrder(MenuOrderParams(
            userId: userId!,
            placeId: placeId,
            placeName: placeName,
            reservationId: reservationId,
            placeMenuItems: _createBasket(placeMenu),
            mealDate: (mealDate ?? DateTime.now()).withTime(mealTime ?? TimeOfDay.now())
        )))
            .fold(
                (failure) =>
                emit(
                    PlaceMenuSubmitOrderFailure(errorMessage: errorFetchData)),
                (nothing) async {
              emit(PlaceMenuSubmitOrderSuccess());
            },

        );
      }
    });
  }

  Future<bool> _pay(double totalBasketCost) async {
    try {
      return await ScaffoldWithNavBar.platform.invokeMethod('getRandomNumber', {"price": totalBasketCost});
    } on PlatformException catch (e) {
    }
    return false;
  }

  List<PlaceMenuItem> _createBasket(PlaceMenu placeMenu) {
    List<PlaceMenuItem> basket = [];

    for (var category in placeMenu.placeMenuCategories) {
      for (var item in category.items) {
        if (item.quantity != 0) {
          basket.add(item);
        }
      }
    }

    return basket;
  }

  String _basketTotal(PlaceMenu placeMenu) {
    double total = 0;

    for (var category in placeMenu.placeMenuCategories) {
      for (var item in category.items) {
        if (item.quantity != 0) {
          total += item.quantity * item.price;
        }
      }
    }

    if (total != 0) {
      return FormatHelper.formatPrice(total);
    } else {
      return StringUtil.EMPTY;
    }
  }

  int _basketTotalItems(PlaceMenu placeMenu) {
    int totalItems = 0;

    for (var category in placeMenu.placeMenuCategories) {
      for (var item in category.items) {
        totalItems += item.quantity;
      }
    }

    return totalItems;
  }
}
