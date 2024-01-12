import 'package:dartz/dartz.dart';
import 'package:i_table/features/reservation_chat/data/model/chat_message_model.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_message.dart';
import 'package:i_table/features/user_orders/data/model/place_order_model.dart';
import 'package:i_table/features/user_orders/domain/entity/place_order.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../reservation_chat/domain/entitiy/chat_messages_factory.dart';
import '../../../user_orders/domain/entity/place_orders_factory.dart';
import '../../domain/entity/place_menu.dart';
import '../../domain/entity/place_menu_factory.dart';
import '../data_source/place_menu_remote_data_source.dart';
import '../model/place_menu_model.dart';

abstract class PlaceMenuRepository {
  Future<Either<Failure, PlaceMenu>> fetchPlaceMenu(String placeId);
  Future<Either<Failure, void>> submitOrder(
      PlaceOrder placeOrder, String? reservationId, ChatMessage orderMessage);
}

class PlaceMenuRepositoryImpl implements PlaceMenuRepository {
  final PlaceMenuRemoteDataSource remote;
  final PlaceMenuFactory placeMenuFactory;
  final PlaceOrdersFactory placeOrdersFactory;
  final ChatMessagesFactory messagesFactory;

  PlaceMenuRepositoryImpl(this.remote, this.placeMenuFactory,
      this.placeOrdersFactory, this.messagesFactory);

  @override
  Future<Either<Failure, PlaceMenu>> fetchPlaceMenu(String placeId) async {
    try {
      PlaceMenuModel? placeMenuModel = await remote.fetchPlaceMenu(placeId);

      if (placeMenuModel != null) {
        return Right(placeMenuFactory.getPlaceMenu(placeMenuModel));
      } else {
        return Left(FetchFailure());
      }
    } on FetchException {
      return Left(FetchFailure());
    }
  }

  @override
  Future<Either<Failure, void>> submitOrder(PlaceOrder placeOrder,
      String? reservationId, ChatMessage orderMessage) async {
    try {
      ChatMessageModel orderMessageModel =
          messagesFactory.getModelFromChatMessage(orderMessage);

      PlaceOrderModel placeOrderModel =
          placeOrdersFactory.getModelFromPlaceOrder(placeOrder);

      await remote.submitOrder(
          placeOrderModel, reservationId, orderMessageModel);

      return Right(null);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
