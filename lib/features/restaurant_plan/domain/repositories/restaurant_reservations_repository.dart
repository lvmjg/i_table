import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/reservation/reservation_entity.dart';

abstract class RestaurantReservationsRepository {
  Future<Either<Failure, List<ReservationEntity>>> fetchRestaurantReservations(
      String restaurantId, DateTime start, DateTime end);
}
