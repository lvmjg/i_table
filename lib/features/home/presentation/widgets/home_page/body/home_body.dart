import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../place_search/presentation/widgets/search_page/body/search_filter.dart';
import '../../../../../place_search/presentation/widgets/search_page/place_search_page.dart';
import 'my_reservations_button.dart';

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
              color: Color(primary),
              fontWeight: FontWeight.w900),
        ),
        SizedBox(height: padding/2,),
        InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PlaceSearchPage())),
          child: const AbsorbPointer(
            absorbing: true,
            child: Hero(
                tag: 'filter',
                child: SearchFilter(color: Colors.white)
            ),
          ),
        ),
        SizedBox(height: padding/2,),
        MyReservationsButton()
      ],
    );
  }
}