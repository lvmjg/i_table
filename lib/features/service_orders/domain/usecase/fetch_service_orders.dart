import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../user_orders/domain/entity/place_order.dart';
import '../../data/repository/service_orders_repository.dart';

class FetchServiceOrders implements UseCaseSync<Stream<List<PlaceOrder>>, PlaceIdParams> {
  final ServiceOrdersRepository serviceOrdersRepository;

  FetchServiceOrders(this.serviceOrdersRepository);

  @override
  Either<Failure, Stream<List<PlaceOrder>>> call(PlaceIdParams params) {
    return serviceOrdersRepository.fetchServiceOrders(params.placeId);
  }
}
