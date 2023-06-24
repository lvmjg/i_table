import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/core/usecase/usecase.dart';
import 'package:i_table/features/restaurant_details/domain/usecase/fetch_restaurant_details.dart';

import '../repositories/panorama_repository.dart';

class FetchPanorama implements UseCase<File, PanoramaParams> {

  final PanoramaRepository panoramaRepository;

  FetchPanorama(this.panoramaRepository);

  @override
  Future<Either<Failure, File>> call(PanoramaParams params) async {
    return await panoramaRepository.fetchPanorama(params.restaurantId, params.elementId);
  }
}

class PanoramaParams extends RestaurantIdParams {
  final String elementId;

  PanoramaParams({required super.restaurantId, required this.elementId});
}
