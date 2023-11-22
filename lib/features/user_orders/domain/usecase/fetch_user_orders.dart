import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/user_orders_repository.dart';
import '../entity/place_order.dart';

class FetchUserOrders
    implements UseCaseSync<Stream<List<PlaceOrder>>, ReservationOrdersParams> {
  final UserOrdersRepository userOrdersRepository;

  FetchUserOrders(this.userOrdersRepository);

  @override
  Either<Failure, Stream<List<PlaceOrder>>> call(
      ReservationOrdersParams params) {
    return userOrdersRepository.fetchUserOrders(
        params.userId, params.reservationId);
  }
}
