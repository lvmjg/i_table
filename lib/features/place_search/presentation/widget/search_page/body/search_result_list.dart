import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../place_details/presentation/widget/place_details_page/place_details_page.dart';
import '../../../../../place_entry/presentation/widget/place_entry_page/place_entry_page.dart';
import '../../../../../place_menu/presentation/widget/place_menu_page/place_menu_page.dart';
import '../../../../domain/entity/place_search.dart';

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
          title: Text(places[index].placeName,
              style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text(places[index].placeAddress.toString(),
              style: Theme.of(context).textTheme.bodySmall),
          trailing: Wrap(
            children: [
              FittedBox(
                fit: BoxFit.fitHeight,
                child: IconButton(
                  icon: Icon(
                    Icons.menu_book_outlined,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PlaceMenuPage(placeId: places[index].placeId)));
                  },
                ),
              ),
              SizedBox(width: padding / 4),
              FittedBox(
                fit: BoxFit.fitHeight,
                child: IconButton(
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlaceDetailsPage(
                            placeId: places[index].placeId,
                            placeName: places[index].placeName)));
                  },
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    PlaceEntryPage(placeId: places[index].placeId)));
          },
        );
      },
      itemCount: places.length,
    );
  }
}
