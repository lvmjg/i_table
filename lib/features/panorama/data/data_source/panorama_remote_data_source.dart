import 'dart:io';

import 'package:i_table/core/data_source/firebase_data_source.dart';
import 'package:i_table/core/error/exceptions.dart';

abstract class PanoramaRemoteDataSource {
  Future<File> fetchPanorama(String placeId, String elementId);
}

class PanoramaRemoteDataSourceImpl implements PanoramaRemoteDataSource {
  FirebaseDataSource fds = FirebaseDataSourceImpl();

  @override
  Future<File> fetchPanorama(String placeId, String elementId) async {
    try {
      return await fds.fetchPanorama(placeId, elementId);
    } catch (e, s) {
      throw FetchException();
    }
  }
}
