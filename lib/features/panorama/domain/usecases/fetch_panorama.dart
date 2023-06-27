import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';

import '../../../place_details/domain/usecase/fetch_place_details.dart';
import '../../data/repositories/panorama_repository.dart';

class FetchPanorama implements UseCase<File, PanoramaParams> {
  final PanoramaRepository panoramaRepository;

  FetchPanorama(this.panoramaRepository);

  @override
  Future<Either<Failure, File>> call(PanoramaParams params) async {
    return await panoramaRepository.fetchPanorama(
        params.placeId, params.elementId);
  }
}

class PanoramaParams extends PlaceIdParams {
  final String elementId;

  PanoramaParams({required super.placeId, required this.elementId});
}
