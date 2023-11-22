import 'package:i_table/features/place_plan/domain/entity/place_reservation/place_reservation.dart';

import '../../../data/model/place_reservation/place_reservation_model.dart';

class PlaceReservationsFactory {
  List<PlaceReservation> getReservations(
      List<PlaceReservationModel> reservations) {
    List<PlaceReservation> newReservations = [];

    reservations.forEach((element) {
      DateTime endDate =
          element.startDate.add(Duration(minutes: element.duration));

      newReservations.add(PlaceReservation(
          id: element.id,
          no: element.no,
          placeId: element.placeId,
          placeName: element.placeName,
          placeAddress: element.placeAddress,
          userId: element.userId,
          startDate: element.startDate,
          endDate: endDate,
          duration: element.duration,
          status: element.status,
          people: element.people,
          tables: element.tables,
          groups: element.groups,
          sittings: element.sittings));
    });

    return newReservations;
  }

  PlaceReservationModel getModelFromPlaceReservation(
      PlaceReservation placeReservation) {
    return PlaceReservationModel(
        no: placeReservation.no,
        placeId: placeReservation.placeId,
        placeName: placeReservation.placeName,
        placeAddress: placeReservation.placeAddress,
        userId: placeReservation.userId,
        startDate: placeReservation.startDate,
        duration: placeReservation.duration,
        people: placeReservation.people,
        status: placeReservation.status,
        tables: placeReservation.tables,
        groups: placeReservation.groups,
        sittings: placeReservation.sittings);
  }
}
