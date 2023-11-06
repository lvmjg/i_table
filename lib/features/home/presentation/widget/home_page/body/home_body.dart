import 'package:flutter/material.dart';
import 'package:i_table/features/service_place/presentation/widget/service_place_page/service_place_page.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/simple_filled_tonal_button.dart';
import '../../../../../place_search/presentation/widget/search_page/body/search_filter.dart';
import '../../../../../place_search/presentation/widget/search_page/place_search_page.dart';
import '../../../../../service_orders/presentation/widget/service_orders_page/service_orders_page.dart';
import '../../../../../user_reservations/presentation/widget/user_reservations_page/user_reservations_page.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          appName,
          style: TextStyle(
              fontSize: 24,
              letterSpacing: 1.6,
              color: primaryColor,
              fontWeight: FontWeight.w900),
        ),
        SizedBox(height: padding/2,),
        Container(
          color: Colors.white,
          child: InkWell(

            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    PlaceSearchPage())),
            child: AbsorbPointer(
              absorbing: true,
              child: Hero(
                  tag: 'filter',
                  child: SearchFilter()
              ),
            ),
          ),
        ),
        SizedBox(height: padding),
        SimpleFilledTonalButton(
          title: myReservations,
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserReservationsPage()))
        ),
        SizedBox(height: padding),
        SimpleFilledTonalButton(
            title: myProfile,
            onPressed: (){},
        ),
        SizedBox(height: padding),
        SimpleFilledTonalButton(
          title: settings,
          onPressed: (){},
        ),
        SizedBox(height: padding),
        SimpleFilledTonalButton(
          title: kitchen,
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ServiceOrdersPage()))
        ),
        SizedBox(height: padding),
        SimpleFilledTonalButton(
            title: service,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ServicePlacePage()))
        ),
      ],
    );
  }
}