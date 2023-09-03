import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../place_details/presentation/widgets/place_details_page/place_details_page.dart';
import '../../../../../place_entry/presentation/widgets/place_entry_page/place_entry_page.dart';
import '../../../../../place_plan/presentation/widgets/place_page/place_page.dart';
import '../../../../domain/entities/place_search.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    super.key,
    required this.places,
  });

  final List<PlaceSearch> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(places[index].placeName),
          subtitle:
              Text(places[index].placeAddress.toString()),
          trailing: FittedBox(
            fit: BoxFit.fitHeight,
            child: IconButton(
              icon: Icon(
                Icons.info_outline_rounded,
                color: Color(primary),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlaceDetailsPage(placeId: places[index].placeId)));
              },
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlaceEntryPage(placeId: places[index].placeId)));
          },
        );
      },
      itemCount: places.length,
    );
  }
}
