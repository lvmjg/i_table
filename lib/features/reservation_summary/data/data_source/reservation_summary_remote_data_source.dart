import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/util/globals.dart';
import '../../../place_plan/data/model/place_reservation/place_reservation_model.dart';

abstract class ReservationSummaryRemoteDataSource{
  Future<void> submitReservation(PlaceReservationModel placeReservationModel);
}

class ReservationSummaryRemoteDataSourceImpl implements ReservationSummaryRemoteDataSource{

  @override
  Future<void> submitReservation(PlaceReservationModel placeReservationModel) async{
    await Future.delayed(Duration(seconds: TEST_TIMEOUT));

    FirebaseFirestore ff = FirebaseFirestore.instance;
    try {
      DocumentReference doc = ff.collection(pathPlacesReservations).doc();

      String reservationId = doc.id.substring(0, 6);
      placeReservationModel.no = reservationId;

      await ff.collection(pathPlacesReservations).doc(doc.id).set(placeReservationModel.toJson());
    } catch(e, s){
      throw FetchException();
    }
  }
}