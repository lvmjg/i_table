import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'hex_color.dart';

class PlanManager {

  late double height;
  late double width;

  late double maxHeight;
  late double maxWidth;

  late List<PlanElement> elements;
  late List<TrackSize> rowSizes;
  late List<TrackSize> columnSizes;

  PlanManager(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height * 0.9;
    width = height * 9 / 16;

    print('a: ${width} ${height}');

    //example elements
    PlanElement a = PlanElement(0, 10, 0, 10);
    PlanElement b = PlanElement(200, 1, 200, 1);
    PlanElement c = PlanElement(40, 45, 20, 25);
    PlanElement d = PlanElement(100, 10, 100, 10);

    elements =[];
    elements..add(a)..add(b);
 /*   int ss =40;
    for(int i = 0; i<ss; i++){
      for(int j = 0; j<ss;j++){
        elements.add(PlanElement(i, 1, j, 1));
      }
    }*/


    //calculate size of plan base on data from server
    PlanElement hLast = elements.reduce((a, b) =>
    (a.rowStart + a.rowSpan) > (b.rowStart + b.rowSpan) ? a : b);
    maxHeight = (hLast.rowStart + hLast.rowSpan).toDouble();

    PlanElement wLast = elements.reduce((a, b) =>
    (a.columnStart + a.columnSpan) > (b.columnStart + b.columnSpan) ? a : b);
    maxWidth = (wLast.columnStart + wLast.columnSpan).toDouble();

    print('b: ${maxWidth} ${maxHeight}');

    //scale to actual screen size
    int cellWidth = (width / maxWidth).toInt();
    columnSizes =
        List.generate(maxWidth.toInt(), (index) => FixedTrackSize(cellWidth.toDouble()));

    int cellHeight = (cellWidth * maxHeight / maxWidth).toInt();
    rowSizes =
        List.generate(maxHeight.toInt(), (index) => FixedTrackSize(cellHeight.toDouble()));

    print('b: ${cellWidth} ${cellHeight}');
  }

  Widget createPlan() {
    List<Widget> planElements = elements.map((e) => GridPlacement(
      columnStart: e.columnStart,
      columnSpan: e.columnSpan,
      rowStart: e.rowStart,
      rowSpan: e.rowSpan,
      child: element('T', 'T1'),
    )).toList();
    return LayoutGrid(columnSizes: columnSizes, rowSizes: rowSizes, children: planElements,);
  }


  Widget element(String type, String number, [String color = "#00FF00"]) {
    if (type == 'S') {
      return Center(
          child: Material(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: const CircleBorder(side: BorderSide.none),
            elevation: 15,
            child: InkWell(
              onTap: (){ print("tapped");},
              child: Ink(
                child: CircleAvatar(
                  // backgroundColor: Colors.orange,
                  child: Text(number),
                ),
              ),
            ),
          ));
    } else if (type == 'T') {
      return /*Container(
          decoration:BoxDecoration(
            color: Colors.red,

            border: Border.all(
              width: 1,
            )
          ),

        child: */
        Material(

          shape: const RoundedRectangleBorder(side: BorderSide.none),
          elevation: 15,
          child: InkWell(
            onTap: (){ print("tapped");},
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(child: Text(number,style: TextStyle(fontSize: 1),textAlign: TextAlign.center,))),
          ),
     //   ),
      );
    } else if (type == 'O') {
      return Center(
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape: const RoundedRectangleBorder(side: BorderSide.none),
            elevation: 15,
            child: Container(
                color: HexColor(color),
                width: double.infinity,
                height: double.infinity,
                child: Center(child: Text(number))),
          ));
    }

    return Container();
  }

}

class PlanElement {
  final int columnStart;
  final int columnSpan;
  final int rowStart;
  final int rowSpan;

  PlanElement(this.columnStart, this.columnSpan, this.rowStart, this.rowSpan);
}