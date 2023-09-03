class PlaceReservation {
  final String placeId;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final int duration;
  final int people;
  final Map<String, Map<String, List<String>>> tables;
  final Map<String, List<String>> groups;
  final List<String> sittings;

  bool analyzed = false;

  PlaceReservation(
      {required this.placeId,
        required this.userId,
        required this.startDate,
        required this.endDate,
        required this.duration,
        required this.people,
        required this.tables,
        required this.groups,
        required this.sittings,
      });
}