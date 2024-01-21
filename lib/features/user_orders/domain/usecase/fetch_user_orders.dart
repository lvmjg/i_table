import 'package:dartz/dartz.dart' hide Order;

import '../../../../core/error/failures.dart';
import '../../../../core/place_order/domain/entity/place_order.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/user_orders_repository.dart';

class FetchUserOrders
    implements UseCaseSync<Stream<List<PlaceOrder>>, String> {
  final UserOrdersRepository ordersRepository;

  FetchUserOrders(this.ordersRepository);

  @override
  Either<Failure, Stream<List<PlaceOrder>>> call(
      String params) {
    return ordersRepository.fetchUserOrders(params);
  }
}
