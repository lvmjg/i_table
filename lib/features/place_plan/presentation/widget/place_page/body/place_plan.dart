import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/util/plan_builder.dart';
import '../../../../domain/entity/place_configuration_entity.dart';
import '../../../bloc/place_bloc.dart';



class PlacePlan extends StatefulWidget {
  final PlaceConfigurationEntity placeConfiguration;
  late PlanBuilder planBuilder;

  PlacePlan(
      {Key? key, required double width, required double height, required this.placeConfiguration})
      : super(key: key) {
    planBuilder = PlanBuilder(width, height, placeConfiguration);
  }

  @override
  State<PlacePlan> createState() => _PlacePlanState();
}

class _PlacePlanState extends State<PlacePlan> {

  var autoSizeGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70,
        width: widget.planBuilder.desiredWidth.toDouble(),
        height: widget.planBuilder.desiredHeight.toDouble(),
        child: BlocBuilder<PlaceBloc, PlaceState>(
          builder: (context, state) {
            PlaceFetchSuccess placePlanFetchSuccess = state as PlaceFetchSuccess;
            return Center(child: widget.planBuilder.createPlan(this.context, placePlanFetchSuccess.editMode, autoSizeGroup));
          },
        )
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      widget.planBuilder.retainTextSize();
    });
  }
}
