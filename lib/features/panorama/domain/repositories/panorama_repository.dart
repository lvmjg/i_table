import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class PanoramaRepository{
  Future<Either<Failure, File>> fetchPanorama(String restaurantId, String elementId);
}