import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../data/repository/place_settings_repository.dart';
import '../entity/place_settings.dart';

class FetchPlaceSettings implements UseCase<PlaceSettings, PlaceIdParams> {
  final PlaceSettingsRepository placeSettingsRepository;

  FetchPlaceSettings(this.placeSettingsRepository);

  @override
  Future<Either<Failure, PlaceSettings>> call(PlaceIdParams params) async {
    return await placeSettingsRepository.fetchPlaceSettings(params.placeId);
  }
}
