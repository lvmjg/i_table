import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../data/repository/place_details_repository.dart';
import '../entity/place_details.dart';

class FetchPlaceDetails
    implements UseCase<PlaceDetails, PlaceIdParams> {
  final PlaceDetailsRepository placeDetailsRepository;

  FetchPlaceDetails(this.placeDetailsRepository);

  @override
  Future<Either<Failure, PlaceDetails>> call(
      PlaceIdParams params) {
    return placeDetailsRepository
        .fetchPlaceDetails(params.placeId);
  }
}


