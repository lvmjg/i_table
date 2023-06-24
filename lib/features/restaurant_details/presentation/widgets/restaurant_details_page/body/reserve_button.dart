import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../reservation_entry/presentation/widgets/reservation_entry_page.dart';
import '../../../../../restaurant_plan/presentation/widgets/restaurant_plan_page/restaurant_plan_page.dart';
import '../../../../../search/domain/entities/search_entity.dart';

class ReserveButton extends StatelessWidget {
  final SearchEntity restaurant;

  const ReserveButton({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(reserve),
        ),
        label: Icon(
          Icons.book_rounded,
          color: Colors.white,
          //  size: 10,
        ),
        style: ElevatedButton.styleFrom(
            side: BorderSide(width: 0, color: Colors.white),
            backgroundColor: Color(primary),
            shape: RoundedRectangleBorder(
                // side: BorderSide.,
                borderRadius: BorderRadius.all(Radius.circular(200)))),
        onPressed: () {
          if (debug) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    RestaurantPlanPage(restaurantId: restaurant.restaurantId)));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    ReservationEntryPage(restaurant: restaurant)));
          }
        });
  }
}
