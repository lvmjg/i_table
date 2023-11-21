import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

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

abstract class Params extends Equatable {
  @override
  List<Object> get props => [];
}

class NoParams extends Params {}

class PlaceIdParams extends Params {
  final String placeId;

  PlaceIdParams({required this.placeId});

  @override
  List<Object> get props => [placeId];
}

class UserIdParams extends Params {
  final String userId;

  UserIdParams({required this.userId});

  @override
  List<Object> get props => [userId];
}

class ReservationParams extends Params {
  final String placeId;
  final String reservationId;

  ReservationParams({required this.placeId, required this.reservationId});

  @override
  List<Object> get props => [placeId, reservationId];
}

class ReservationChatAddMessageRequestedParams extends Params {
  final String reservationId;
  final ChatMessage chatMessage;

  ReservationChatAddMessageRequestedParams({required this.reservationId, required this.chatMessage});

  @override
  List<Object> get props => [reservationId, chatMessage];
}



class ReservationSummaryParams extends Params {
  final PlaceReservation placeReservation;

  ReservationSummaryParams({required this.placeReservation});

  @override
  List<Object> get props => [placeReservation];
}

class PlaceMenuOrderParams extends Params {
  final String userId;
  final String placeId;
  final String placeName;
  final String reservationId;
  final List<PlaceMenuItem> placeMenuItems;

  PlaceMenuOrderParams({required this.userId, required this.placeId, required this.placeName, required this.reservationId, required this.placeMenuItems});

  @override
  List<Object> get props => [userId];
}

class UserOrdersParams extends Params {
  final String userId;
  final String reservationId;

  UserOrdersParams({required this.userId, required this.reservationId});

  @override
  List<Object> get props => [userId, reservationId];
}
