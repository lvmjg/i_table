import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:i_table/core/error/failures.dart';
import 'package:i_table/features/panorama/domain/repositories/panorama_repository.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/globals.dart';
import '../datasources/panorama_remote_data_source.dart';

class PanoramaRepositoryImpl implements PanoramaRepository {
  final PanoramaRemoteDataSource remote;

  PanoramaRepositoryImpl(this.remote);

  List<String> cachedImages = [];
  @override
  Future<Either<Failure, File>> fetchPanorama(
      String restaurantId, String elementId) async {

    String imageIdentifier = '$restaurantId$elementId$imageExtension';
    bool isAlreadyDownloaded = cachedImages.contains(imageIdentifier);
    if(isAlreadyDownloaded){
      final documentsDirectory = await getApplicationDocumentsDirectory();
      final filePath = "${documentsDirectory.path}/$imageIdentifier";
      final file = File(filePath);

      if(file.existsSync()){
        return Right(file);
      }
    }

    File panoramaImage;
    try {
      panoramaImage = await remote.fetchPanorama(restaurantId, elementId);

      cachedImages.add(imageIdentifier);
      return Right(panoramaImage);
    } on FetchException {
      return Left(FetchFailure());
    }
  }
}
