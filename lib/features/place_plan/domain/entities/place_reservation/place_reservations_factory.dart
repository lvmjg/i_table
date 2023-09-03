

import 'package:i_table/features/place_plan/domain/entities/place_reservation/place_reservation.dart';

import '../../../data/models/place_reservation/place_reservation_model.dart';

class PlaceReservationsFactory {
  List<PlaceReservation> getReservations(List<PlaceReservationModel> reservations) {
    List<PlaceReservation> newReservations = [];

    reservations.forEach((element) {
      DateTime endDate =
          element.startDate.add(Duration(minutes: element.duration));

      newReservations.add(PlaceReservation(
          placeId: element.placeId,
          userId: element.placeId,
          startDate: element.startDate,
          endDate: endDate,
          duration: element.duration,
          people: element.people,
          tables: element.tables,
          groups: element.groups,
          sittings: element.sittings));
    });

    return newReservations;
  }
}
