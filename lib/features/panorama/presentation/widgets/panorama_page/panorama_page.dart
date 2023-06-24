import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/restaurant_plan/presentation/bloc/restaurant_plan_bloc.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/restaurant_plan_app_bar.dart';
import 'package:i_table/features/restaurant_plan/presentation/widgets/body/restaurant_plan_body.dart';
import 'package:panorama/panorama.dart';

import '../../../../../core/util/globals.dart';
import '../../bloc/panorama_bloc.dart';
import 'body/panorama_body.dart';
import 'floatingactionbutton/panorama_floatingactionbutton.dart';

class PanoramaPage extends StatefulWidget {
  final String restaurantId;
  final String elementId;

  const PanoramaPage(
      {Key? key, required this.restaurantId, required this.elementId})
      : super(key: key);

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
        floatingActionButton: PanoramaFloatingActionButton(),
        bottomNavigationBar: Container(
          height: 50,
          decoration: BoxDecoration(color: Color(primary),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(padding), topRight: Radius.circular(padding))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.elementId,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(width: padding,),
              Icon(Icons.location_searching_rounded, color: Colors.white,)
            ],
          ),
        ),
        body: PanoramaBody(
            restaurantId: widget.restaurantId, elementId: widget.elementId));
  }

  @override
  void initState() {
    super.initState();
    context.read<PanoramaBloc>().add(PanoramaInit(
        restaurantId: widget.restaurantId, elementId: widget.elementId));
  }
}
