import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../user_orders/domain/entity/place_order.dart';
import '../../data/repository/service_orders_repository.dart';

class FetchServiceOrders implements UseCase<Stream<List<PlaceOrder>>, String> {
  final ServiceOrdersRepository serviceOrdersRepository;

  FetchServiceOrders(this.serviceOrdersRepository);

  @override
  Future<Either<Failure, Stream<List<PlaceOrder>>>> call(String placeId) async {
    return await serviceOrdersRepository.fetchServiceOrders(placeId);
  }
}
