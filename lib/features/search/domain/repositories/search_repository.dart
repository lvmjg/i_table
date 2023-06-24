import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/search_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchEntity>>> fetchRestaurants();
}
