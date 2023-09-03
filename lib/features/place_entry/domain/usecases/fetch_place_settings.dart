import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../place_details/domain/usecase/fetch_place_details.dart';
import '../../data/repositories/place_settings_repository.dart';
import '../entities/place_settings.dart';

class FetchPlaceSettings
    implements UseCase<PlaceSettings, PlaceIdParams> {
  final PlaceSettingsRepository placeSettingsRepository;

  FetchPlaceSettings(this.placeSettingsRepository);

  @override
  Future<Either<Failure, PlaceSettings>> call(
      PlaceIdParams params) {
    return placeSettingsRepository
        .fetchPlaceSettings(params.placeId);
  }
}
