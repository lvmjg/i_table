import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/place_order/domain/entity/place_order.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/service_orders_repository.dart';

class FetchTodaysServiceOrders
    implements UseCaseSync<Stream<List<PlaceOrder>>, PlaceIdParams> {
  final ServiceOrdersRepository serviceOrdersRepository;
  final bool filterCompleted;

  FetchTodaysServiceOrders(this.serviceOrdersRepository, {required this.filterCompleted});

  @override
  Either<Failure, Stream<List<PlaceOrder>>> call(PlaceIdParams params)  {
    return serviceOrdersRepository.fetchTodaysServiceOrders(params.placeId, filterCompleted: filterCompleted);
  }
}
