
import 'dart:js';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:i_table/features/restaurant_plan/domain/entity/restaurant_plan/restaurant_setting.dart';
import 'package:i_table/features/restaurant_plan/presentation/bloc/restaurant_plan_bloc.dart';
import '../../features/restaurant_plan/domain/entity/restaurant_plan/restaurant_plan_element_entity.dart';
import 'hex_color.dart';

class PlanManager {

  late int desiredHeight;
  late int desiredWidth;

  late int cellWidth;
  late int cellHeight;

  late List<RestaurantPlanElementEntity> elements =[];
  late List<TrackSize> rowSizes;
  late List<TrackSize> columnSizes;

  late RestaurantSetting restaurantSetting;

  PlanManager(double width, double height, this.restaurantSetting) {
    initializeSizes(width, height);
  }

  void initializeSizes(double width, double height){
    //get size of the canvas (widget) and make sizes even
    print('Widget max size: $width $height');

    double initialScaleFactor = 1;
    desiredHeight = (height * initialScaleFactor).toInt();
    desiredWidth = (width * initialScaleFactor).toInt();

    if(desiredHeight.isOdd) {
      desiredHeight--;
    }
    if(desiredWidth.isOdd){
      desiredWidth--;
    }

    print('Size to draw: ${desiredWidth} ${desiredHeight}');

    //plan

    //PlanGenerator planGenerator = PlanGenerator();
    //elements = planGenerator.get();
    elements = restaurantSetting.restaurantPlanLevels.first.restaurantPlan.values.toList();

    //calculate size of plan base on data from server
    RestaurantPlanElementEntity hLast = elements.reduce((a, b) =>
    (a.rowStart + a.rowSpan) > (b.rowStart + b.rowSpan) ? a : b);
    double maxHeight = (hLast.rowStart + hLast.rowSpan).toDouble();

    RestaurantPlanElementEntity wLast = elements.reduce((a, b) =>
    (a.columnStart + a.columnSpan) > (b.columnStart + b.columnSpan) ? a : b);
    double maxWidth = (wLast.columnStart + wLast.columnSpan).toDouble();

    print('Max sizes of plan: ${maxWidth} ${maxHeight}');

    //scale
    double scale = desiredHeight / maxHeight.toDouble();
    desiredWidth = (maxWidth * scale).toInt();

    //scale to actual screen size
    cellHeight = (desiredHeight/ maxHeight).toInt();

    if(cellHeight.isOdd) {
      cellHeight--;
    }

    rowSizes =
        List.generate(maxHeight.toInt(), (index) =>FlexibleTrackSize(1));

    cellWidth = (desiredWidth/ maxWidth).toInt();

    if(cellWidth.isOdd) {
      cellWidth--;
    }

    columnSizes =
        List.generate(maxWidth.toInt(), (index) => FlexibleTrackSize(1));

    print('b: ${cellWidth} ${cellHeight}');
  }

  Widget createPlan(BuildContext buildContext) {
    List<Widget> planElements = elements.map((e) => GridPlacement(
      columnStart: e.columnStart,
      columnSpan: e.columnSpan,
      rowStart: e.rowStart,
      rowSpan: e.rowSpan,
      child: element(buildContext, e.type, e.name, e.color),
    )).toList();
    return LayoutGrid(columnSizes: columnSizes, rowSizes: rowSizes, children: planElements,);
  }

 AutoSizeGroup autoSizeGroup = AutoSizeGroup();
  Widget element(BuildContext context, String type, String name, [String color = "#FFFFFF"]) {
    double elevation = cellHeight.toDouble();


    TextStyle elementTextStyle = TextStyle(fontSize: 30, color: Colors.black);
    AutoSizeText elementText = AutoSizeText(name, minFontSize: 1, style: elementTextStyle, group: autoSizeGroup,);
    //Text elementText = Text(name, style: elementTextStyle);

    double cwidth = double.infinity;
    double cheight = double.infinity;
    if (type == 'S') {
      return Center(
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape: const CircleBorder(),
            elevation: elevation,
            child: InkWell(
              onTap: (){
                context.read<RestaurantPlanBloc>().add(RestaurantPlanElementTapped(planElementId: name));
              },
              child: Ink(
                color: HexColor(color),
                child: Container(
                  width: cwidth,
                  height: cheight,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Center(child: elementText),
                  ),
                ),
              ),
            ),
          ));
    } else if (type == 'T') {
      return Material(
          shape: const RoundedRectangleBorder(),
        elevation: elevation,
          child: InkWell(
            onTap: (){
              context.read<RestaurantPlanBloc>().add(RestaurantPlanElementTapped(planElementId: name));
            },
            child: Ink(
              color: HexColor(color),
              child: Container(
                  width: cwidth,
                  height: cheight,
                  child: Center(child: elementText)),
            ),
          ),
      );
    } else if (type == 'O') {
      return Material(
        shape: const RoundedRectangleBorder(),
        elevation: elevation,
        child: InkWell(
          onTap: (){},
          child: Ink(
            color: HexColor(color),
            child: Container(
                width: cwidth,
                height: cheight,
                child: Center(child: elementText)),
          ),
        ),
      );
    }

    return Container();
  }

}

