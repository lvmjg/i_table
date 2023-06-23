import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/restaurant_plan/presentation/bloc/restaurant_plan_bloc.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/restaurant_plan_app_bar.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/body/restaurant_plan_body.dart';
import 'package:panorama/panorama.dart';

class PanoramaPage extends StatefulWidget {
  const PanoramaPage({Key? key}) : super(key: key);

  @override
  State<PanoramaPage> createState() => _PanoramaPageState();
}

class _PanoramaPageState extends State<PanoramaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: RestaurantPlanAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Text('Zamknij podgląd'),
            label: Icon(Icons.close_rounded, color: Colors.white,)
        ),
        body: Panorama(
          animSpeed: 1.0,
          hotspots: [
            Hotspot(
                latitude: 0.0,
                longitude: 160.0,
                width: 90.0,
                height: 75.0,
                widget: Container(color: Colors.white, child: Text("Bar", style: TextStyle(color: Colors.deepPurple),))),
          ],
          child: Image.asset('assets/pan.jpg'),
        ));
  }
}
