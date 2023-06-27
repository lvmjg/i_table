import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:i_table/core/error/exceptions.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:path_provider/path_provider.dart';

abstract class PanoramaRemoteDataSource{
  Future<File> fetchPanorama(String placeId, String elementId);
}

class PanoramaRemoteDataSourceImpl implements PanoramaRemoteDataSource{

  @override
  Future<File> fetchPanorama(String placeId, String elementId) async {
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    FirebaseStorage fa = FirebaseStorage.instance;

    final elementRef = fa.ref()
    .child(placeId)
    .child(pathPanoramas)
    .child('$elementId.jpg');

    final String imageIdentifier = '$placeId$elementId$imageExtension';
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final filePath = "${documentsDirectory.path}/$imageIdentifier";
    print(filePath);
    final file = File(filePath);

    TaskSnapshot taskSnapshot;
    try {
      taskSnapshot = await elementRef.writeToFile(file);

      if(taskSnapshot.state == TaskState.success) {
        return file;
      }
      else {
        throw FetchException();
      }
    } catch(e, s) {
      throw FetchException();
    }
  }

}