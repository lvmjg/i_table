import 'package:dartz/dartz.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/reservation_chat/data/data_source/reservation_chat_remote_data_source.dart';
import 'package:i_table/features/reservation_chat/data/repository/reservation_chat_repository.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_message.dart';
import 'package:i_table/features/reservation_chat/domain/entitiy/chat_messages_factory.dart';
import 'package:i_table/features/user_orders/domain/entity/place_order.dart';
import 'package:i_table/features/user_orders/domain/entity/place_order_item.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/place_menu_repository.dart';
import '../entity/place_menu.dart';
import '../entity/place_menu_item.dart';

class SubmitOrder implements UseCase<void, MenuOrderParams> {
  final PlaceMenuRepository placeMenuRepository;

  SubmitOrder(this.placeMenuRepository);

  @override
  Future<Either<Failure, void>> call(MenuOrderParams params) async {
    List<PlaceOrderItem> placeOrderItems = [];

    params.placeMenuItems.forEach((item) {
      placeOrderItems.add(PlaceOrderItem(
          id: item.id,
          category: item.category,
          name: item.name,
          description: item.description,
          price: item.price,
          note: item.note,
          quantity: item.quantity,
          status: false));
    });

    PlaceOrder placeOrder = PlaceOrder(
        userId: params.userId,
        reservationId: params.reservationId,
        placeId: params.placeId,
        placeName: params.placeName,
        status: false,
        orderDateTime: DateTime.now(),
        userOrders: placeOrderItems);

    ChatMessage orderMessage = ChatMessage(
        sender: loggedUserId,
        sendTime: DateTime.now(),
        message: placeOrder.summary);

    return await placeMenuRepository.submitOrder(
        placeOrder, params.reservationId, orderMessage);
  }
}
