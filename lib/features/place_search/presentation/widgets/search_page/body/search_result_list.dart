import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../place/presentation/widgets/place_page/place_page.dart';
import '../../../../../place_details/presentation/widgets/place_details_page/place_details_page.dart';
import '../../../../../reservation_entry/presentation/widgets/reservation_entry_page/reservation_entry_page.dart';
import '../../../../domain/entities/place_search_entity.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    super.key,
    required this.places,
  });

  final List<PlaceSearchEntity> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(places[index].placeName),
          subtitle:
              Text(places[index].placeAddress.toString()),
          trailing: InkWell(
              onTap: () => print('test'),
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: IconButton(
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: Color(primary),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlaceDetailsPage(
                            placeId:
                                places[index].placeId)));
                  },
                ),
              )),
          onTap: () {
            if (debug) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlacePage(
                      placeId: places[index].placeId)));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReservationEntryPage(
                      place: places[index])));
            }
          },
        );
      },
      itemCount: places.length,
    );
  }
}
