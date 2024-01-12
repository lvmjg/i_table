import 'package:flutter/material.dart';

import '../../../../../../core/util/size_helper.dart';
import '../../../../../../core/widget/search_card.dart';
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
        itemCount: places.length,
        itemBuilder: (context, index) {
          return SearchCard(
              placeSearch: places[index],
              onPressed: () {
               /* showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: primaryColor,
                    builder: (context) {
                      return Container(
                        child: Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: MenuItemDetailsSheet(
                              placeMenuItem: c.items[index],
                              buttonsEnabled: widget.menuInReservationMode,
                            )),
                      );
                    });*/
              }, imageSize: SizeHelper.getHighestSize(context)/8);
        });
  }
}
