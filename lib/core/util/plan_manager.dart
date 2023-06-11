import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:i_table/core/util/plan_generator.dart';
import '../../features/restaurant_plan/domain/entity/restaurant_plan/restaurant_plan_element_entity.dart';
import 'hex_color.dart';

class PlanManager {

  late int desiredHeight;
  late int desiredWidth;

  late double maxHeight;
  late double maxWidth;

  late int cellWidth;
  late int cellHeight;

  late List<RestaurantPlanElementEntity> elements =[];
  late List<TrackSize> rowSizes;
  late List<TrackSize> columnSizes;

  PlanManager(double width, double height) {
    initializeSizes(width, height);

  }

  Widget createPlan(BuildContext? context) {


    List<Widget> planElements = elements.map((e) => GridPlacement(
      columnStart: e.columnStart,
      columnSpan: e.columnSpan,
      rowStart: e.rowStart,
      rowSpan: e.rowSpan,
      child: element(e.type, e.name, e.color),
    )).toList();
    return LayoutGrid(columnSizes: columnSizes, rowSizes: rowSizes, children: planElements,);
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

    PlanGenerator planGenerator = PlanGenerator();
    elements = planGenerator.get();

    //calculate size of plan base on data from server
    RestaurantPlanElementEntity hLast = elements.reduce((a, b) =>
    (a.rowStart + a.rowSpan) > (b.rowStart + b.rowSpan) ? a : b);
    maxHeight = (hLast.rowStart + hLast.rowSpan).toDouble();

    RestaurantPlanElementEntity wLast = elements.reduce((a, b) =>
    (a.columnStart + a.columnSpan) > (b.columnStart + b.columnSpan) ? a : b);
    maxWidth = (wLast.columnStart + wLast.columnSpan).toDouble();

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

 AutoSizeGroup autoSizeGroup = AutoSizeGroup();
  Widget element(String type, String name, [String color = "#FFFFFF"]) {
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
              onTap: (){ print("tapped");},
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
            onTap: (){ print("tapped");},
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
          onTap: (){ print("tapped");},
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

