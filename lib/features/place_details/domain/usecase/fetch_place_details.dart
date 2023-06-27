import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';


import '../../data/repositories/place_details_repository.dart';
import '../entity/place_details_entity.dart';

class FetchPlaceDetails
    implements UseCase<PlaceDetailsEntity, PlaceIdParams> {
  final PlaceDetailsRepository placeDetailsRepository;

  FetchPlaceDetails(this.placeDetailsRepository);

  @override
  Future<Either<Failure, PlaceDetailsEntity>> call(
      PlaceIdParams params) {
    return placeDetailsRepository
        .fetchPlaceDetails(params.placeId);
  }
}

class PlaceIdParams extends Params {
  final String placeId;

  PlaceIdParams({required this.placeId});

  @override
  List<Object> get props => [placeId];
}
