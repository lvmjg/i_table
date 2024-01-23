import 'package:dartz/dartz.dart';
import 'package:i_table/features/service_orders/data/repository/service_orders_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class UpdateServiceOrderStatus
    implements UseCase<void, OrderUpdateStatusParams> {
  final ServiceOrdersRepository repository;

  UpdateServiceOrderStatus(this.repository);

  @override
  Future<Either<Failure, void>> call(OrderUpdateStatusParams params) async {
    return await repository.updateStatus(params.copyWith(newStatus: params.newStatus));
  }

}