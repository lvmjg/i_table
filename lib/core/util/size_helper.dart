import 'package:flutter/cupertino.dart';

class SizeHelper {

  static double getHighestSize(BuildContext context){
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return h > w ? h : w;
  }
}