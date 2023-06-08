import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';
import '../../../core/util/globals.dart';
import '../../search/presentation/widgets/search_bar.dart';

class ReservationEntryPage extends StatefulWidget {

  final RestaurantDetailsEntity restaurant;

  const ReservationEntryPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<ReservationEntryPage> createState() => _ReservationEntryPageState();
}

class _ReservationEntryPageState extends State<ReservationEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(primary),
      child: Scaffold(
        backgroundColor: Color(primary),
        appBar: AppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.white),
          shape: roundedRectangleBorder,
          foregroundColor: Color(primary),
          backgroundColor: Colors.white,
          elevation: elevation,
          toolbarHeight: toolbarHeight,
          flexibleSpace:
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: EdgeInsets.all(padding/2),
              child: Text(
                appName,
                style: TextStyle(
                    fontSize: 14,
                    color: Color(primary),
                    fontWeight: FontWeight.w900),
              ),
            ),
          ]),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //widget.restaurant.name
              '',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(height: padding * 3,),
            Text(
              'Wybierz termin',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Hero(
                tag: 'search_bar',
                child: SearchBar(
                  isOnRestaurantSearchPage: false,
                )),
            Text(
              'Wybierz godzinę',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Hero(
                tag: 'search_bar',
                child: SearchBar(
                  isOnRestaurantSearchPage: false,
                ))
          ],
        ),
      ),
    );
  }
}
