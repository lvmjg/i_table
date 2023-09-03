import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../features/panorama/presentation/widgets/panorama_page/panorama_page.dart';

import '../../features/place_plan/domain/entities/place_configuration_entity.dart';
import '../../features/place_plan/domain/entities/place_plan/plan_element.dart';
import '../../features/place_plan/domain/entities/place_plan/plan_state.dart';
import '../../features/place_plan/presentation/bloc/place_bloc.dart';
import 'hex_color.dart';

class PlanBuilder {
  late int desiredHeight;
  late int desiredWidth;

  late int cellWidth;
  late int cellHeight;

  late List<PlanElement> elements = [];
  late List<TrackSize> rowSizes;
  late List<TrackSize> columnSizes;

  late PlaceConfigurationEntity placeConfiguration;

  PlanBuilder(double width, double height, this.placeConfiguration) {
    initializeSizes(width, height);
  }

  void initializeSizes(double width, double height) {
    //get size of the canvas (widget) and make sizes even
    print('Widget max size: $width $height');

    double initialScaleFactor = 1;
    desiredHeight = (height * initialScaleFactor).toInt();
    desiredWidth = (width * initialScaleFactor).toInt();

    if (desiredHeight.isOdd) {
      desiredHeight--;
    }
    if (desiredWidth.isOdd) {
      desiredWidth--;
    }

    print('Size to draw: ${desiredWidth} ${desiredHeight}');

    //plan

    //PlanGenerator planGenerator = PlanGenerator();
    //elements = planGenerator.get();

    elements.clear();

    elements.addAll(placeConfiguration.getItems());


    //calculate size of plan base on data from server
    PlanElement hLast = elements.reduce(
        (a, b) => (a.rowStart + a.rowSpan) > (b.rowStart + b.rowSpan) ? a : b);
    double maxHeight = (hLast.rowStart + hLast.rowSpan).toDouble();

    PlanElement wLast = elements.reduce((a, b) =>
        (a.columnStart + a.columnSpan) > (b.columnStart + b.columnSpan)
            ? a
            : b);
    double maxWidth = (wLast.columnStart + wLast.columnSpan).toDouble();

    print('Max sizes of plan: ${maxWidth} ${maxHeight}');

    //scale
    double scale = desiredHeight / maxHeight.toDouble();
    desiredWidth = (maxWidth * scale).toInt();

    //scale to actual screen size
    cellHeight = (desiredHeight / maxHeight).toInt();

    if (cellHeight.isOdd) {
      cellHeight--;
    }

    rowSizes =
        List.generate(maxHeight.toInt(), (index) => FlexibleTrackSize(1));

    cellWidth = (desiredWidth / maxWidth).toInt();

    if (cellWidth.isOdd) {
      cellWidth--;
    }

    columnSizes =
        List.generate(maxWidth.toInt(), (index) => FlexibleTrackSize(1));

    print('b: ${cellWidth} ${cellHeight}');
  }

  Widget createPlan(
      BuildContext buildContext, bool editMode, AutoSizeGroup autoSizeGroup) {
    print(columnSizes);
    print(rowSizes);

    List<Widget> planElements = elements
        .map((e) => GridPlacement(
              columnStart: e.columnStart,
              columnSpan: e.columnSpan,
              rowStart: e.rowStart,
              rowSpan: e.rowSpan,
              child: element(buildContext, editMode, e, e.type, e.name,
                  autoSizeGroup, e.color),
            ))
        .toList();
    return LayoutGrid(
      columnSizes: columnSizes,
      rowSizes: rowSizes,
      children: planElements,
    );
  }

  GlobalKey globalKey = GlobalKey();

  Widget element(
      BuildContext context,
      editMode,
      PlanElement elementEntity,
      String type,
      String name,
      AutoSizeGroup autoSizeGroup,
      [String color = "#FFFFFF"]) {
    double elevation = cellHeight.toDouble();

    TextStyle elementTextStyle = TextStyle(color: Colors.black);
    AutoSizeText elementText = AutoSizeText(
      name,
      textAlign: TextAlign.center,
      minFontSize: 1,
      maxFontSize: 29,
      // presetFontSizes: const [20,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1],
      style: elementTextStyle,
      group: autoSizeGroup,
      softWrap: true,
    );
    //Text elementText = Text(name, style: elementTextStyle);

    // double cwidth = cellWidth.toDouble();
    // double cheight = cellHeight.toDouble();

    double cwidth = double.infinity;
    double cheight = double.infinity;

    if (type == 'T') {
      return AbsorbPointer(
        absorbing: blockTouchBasedOnState(editMode, elementEntity.localState),
        child: Opacity(
          opacity:
              setOpacityBasedOnState(editMode, elementEntity.localState),
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape: const RoundedRectangleBorder(),
            elevation: elevation,
            child: InkWell(
              onLongPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PanoramaPage(
                          elementId: name,
                          placeId: '9wtiLFlRdZ1b8abbPoet' ,
                        )));
              },
              onTap: () {
                context
                    .read<PlaceBloc>()
                    .add(PlacePlanElementTapped(planElementId: name));
              },
              child: Ink(
                color: selectColorBasedOnState(elementEntity.localState),
                child: SizedBox(
                  width: cwidth,
                  height: cheight,
                  child: Center(child: elementText),
                ),
              ),
            ),
          ),
        ),
      );

      //  return SizedBox(width: cwidth, height: cheight, child: elementText);
    } else if (type == 'S') {
      return AbsorbPointer(
        absorbing: blockTouchBasedOnState(editMode, elementEntity.localState),
        child: Opacity(
          opacity:
              setOpacityBasedOnState(editMode, elementEntity.localState),
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape: const CircleBorder(),
            elevation: elevation,
            child: InkWell(
              onTap: () {
                print("Tapped: " + name);
                context
                    .read<PlaceBloc>()
                    .add(PlacePlanElementTapped(planElementId: name));
              },
              child: Ink(
                color: selectColorBasedOnState(elementEntity.localState),
                child: SizedBox(
                    width: cwidth,
                    height: cheight,
                    child: Center(child: elementText)),
              ),
            ),
          ),
        ),
      );
      // return SizedBox(width: cwidth, height: cheight, child: elementText);
    } else if (type == 'O') {
      return AbsorbPointer(
        absorbing: blockTouchBasedOnState(editMode, elementEntity.localState),
        child: Opacity(
          opacity:
              setOpacityBasedOnState(editMode, elementEntity.localState),
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape: const RoundedRectangleBorder(),
            elevation: elevation,
            child: InkWell(
              onTap: () {},
              child: Ink(
                color: HexColor(color),
                child: SizedBox(
                    width: cwidth,
                    height: cheight,
                    child: Center(child: elementText)),
              ),
            ),
          ),
        ),
      );

      //return SizedBox(width: cwidth, height: cheight, child: elementText);
    }

    return Container();
  }

  Color selectColorBasedOnState(PlanState elementState) {
    if (elementState == PlanState.reserved) {
      return Colors.red;
    }

    if (elementState == PlanState.potentiallyReserved) {
      return Colors.orangeAccent;
    }

    if (elementState == PlanState.selected) {
      return Colors.green;
    }

    if (elementState == PlanState.highlighted) {
      return Colors.greenAccent;
    }

    if (elementState == PlanState.notReserved) {
      return Colors.white;
    }

    return Colors.white;
  }

  double setOpacityBasedOnState(bool editMode, PlanState elementState) {
    if (editMode &&
        (elementState != PlanState.selected) &&
        (elementState != PlanState.highlighted)) {
      return 0.2;
    }

    return 1;
  }

  void retainTextSize() {
    //   AutoSizeText autoSizeText = globalKey.currentWidget as AutoSizeText;
    //  autoSizeText.
    //  groupTextSize = autoSizeText.
  }

  bool blockTouchBasedOnState(editMode, PlanState elementState) {
    if (editMode && (elementState == PlanState.reserved || elementState == PlanState.notReserved)) {
      return true;
    } else {
      return false;
    }
  }
}
