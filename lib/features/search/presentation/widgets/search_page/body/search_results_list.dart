import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../reservation_entry/presentation/widgets/reservation_entry_page.dart';
import '../../../../../restaurant_details/presentation/widgets/restaurant_details_page/restaurant_details_page.dart';
import '../../../../../restaurant_plan/presentation/widgets/restaurant_plan_page/restaurant_plan_page.dart';
import '../../../../domain/entities/search_entity.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({
    super.key,
    required this.fetchedRestaurants,
  });

  final List<SearchEntity> fetchedRestaurants;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(fetchedRestaurants[index].restaurantName),
          subtitle:
              Text(fetchedRestaurants[index].restaurantAddress.toString()),
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
                        builder: (context) => RestaurantDetailsPage(
                            restaurantId:
                                fetchedRestaurants[index].restaurantId)));
                  },
                ),
              )),
          onTap: () {
            if (debug) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RestaurantPlanPage(
                      restaurantId: fetchedRestaurants[index].restaurantId)));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReservationEntryPage(
                      restaurant: fetchedRestaurants[index])));
            }
          },
        );
      },
      itemCount: fetchedRestaurants.length,
    );
  }
}
