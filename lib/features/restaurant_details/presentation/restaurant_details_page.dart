import 'package:flutter/material.dart';
import 'package:i_table/features/restaurant_details/presentation/widgets/restaurant_details_body.dart';
import 'widgets/restuarant_details_app_bar.dart';

class RestaurantDetailsPage extends StatefulWidget {
  final String restaurantId;

  const RestaurantDetailsPage({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RestaurantDetailsAppBar(),
      body: RestaurantDetailsBody(restaurantId: widget.restaurantId),
    );
  }

/* List<Widget> getOpeningHours() {
    List<String> hours = [];
    hours.add('Pn 16-02');
    hours.add('Wt 16-02');
    hours.add('Śr 16-02');
    hours.add('Czw 16-02');
    hours.add('Pt 16-02');
    hours.add('Sb 16-02');
    hours.add('Nd 16-02');

    return hours
        .map((e) => Padding(
              padding: EdgeInsets.all(2),
              child: Chip(
                label: Text(e),
                backgroundColor: HexColor("#f2f2f2"),
              ),
            ))
        .toList();
  }*/
}




