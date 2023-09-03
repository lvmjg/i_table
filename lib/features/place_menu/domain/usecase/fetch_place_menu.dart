import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/repository/place_menu_repository.dart';
import '../entity/place_menu.dart';

class FetchPlaceMenu implements UseCase<PlaceMenu, PlaceIdParams> {
  final PlaceMenuRepository placeMenuRepository;

  FetchPlaceMenu(this.placeMenuRepository);

  @override
  Future<Either<Failure, PlaceMenu>> call(PlaceIdParams params) {
    return placeMenuRepository.fetchPlaceMenu(params.placeId);
  }
}
