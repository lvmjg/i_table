import 'package:dartz/dartz.dart';
import 'package:i_table/core/util/copyable.dart';

import '../../features/place_menu/domain/entity/place_menu_item.dart';
import '../../features/place_plan/domain/entity/place_reservation/place_reservation.dart';
import '../../features/reservation_chat/domain/entitiy/chat_message.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseSync<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class Params {}

class NoParams extends Params {}

class ErrorParams extends Params {
  final String errorMessage;

  ErrorParams({required this.errorMessage});
}

class PlaceIdParams extends Params {
  final String placeId;

  PlaceIdParams({required this.placeId});
}

class UserIdParams extends Params {
  final String userId;

  UserIdParams({required this.userId});
}

class ReservationIdParams extends Params {
  final String reservationId;

  ReservationIdParams({required this.reservationId});
}

class ReservationUpdateStatusParams extends Params implements Copyable<ReservationUpdateStatusParams> {
  final String reservationId;
  final String closeStatus;
  final String closedBy;
  final DateTime startDate;

  ReservationUpdateStatusParams({required this.reservationId, required this.closeStatus, required this.closedBy, required this.startDate});

  @override
  ReservationUpdateStatusParams copyWith({
    String? reservationId,
    String? closeStatus,
    String? closedBy,
    DateTime? startDate
  }) =>
      ReservationUpdateStatusParams(
          reservationId: reservationId ?? this.reservationId,
        closeStatus: closeStatus ?? this.closeStatus,
        closedBy: closedBy ?? this.closedBy,
        startDate: startDate ?? this.startDate,
      );
}

class OrderUpdateStatusParams extends Params implements Copyable<OrderUpdateStatusParams> {
  final String orderId;
  final String newStatus;

  OrderUpdateStatusParams({required this.orderId, required this.newStatus});

  @override
  OrderUpdateStatusParams copyWith({
    String? orderId,
    String? newStatus,
  }) =>
      OrderUpdateStatusParams(
        orderId: orderId ?? this.orderId,
        newStatus: newStatus ?? this.newStatus,
      );
}


class ReservationParams extends Params implements PlaceIdParams {
  @override
  final String placeId;
  final String reservationId;

  ReservationParams({required this.placeId, required this.reservationId});
}

class ReservationChatMessageParams extends Params {
  final String reservationId;
  final ChatMessage chatMessage;

  ReservationChatMessageParams(
      {required this.reservationId, required this.chatMessage});
}

class ReservationSummaryParams extends Params {
  final PlaceReservation reservation;

  ReservationSummaryParams({required this.reservation});
}

class ReservationOrdersParams extends Params implements UserIdParams {
  @override
  final String userId;
  final String? reservationId;

  ReservationOrdersParams({required this.userId, this.reservationId});
}

class MenuOrderParams extends Params implements UserIdParams {
  @override
  final String userId;
  final String placeId;
  final String placeName;
  final String? reservationId;
  final List<PlaceMenuItem> placeMenuItems;
  final DateTime mealDate;

  MenuOrderParams(
      {required this.userId,
      required this.placeId,
      required this.placeName,
      required this.reservationId,
      required this.placeMenuItems,
        required this.mealDate
      });
}
