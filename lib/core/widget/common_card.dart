import 'package:flutter/material.dart';

import '../util/globals.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  late double outerPadding;
  late double innerPadding;
  late double elevation;
  late Color? backgroundColor;

  CommonCard(
      {Key? key,
      required this.child,
      this.onPressed,
      this.outerPadding = 0,
        this.innerPadding = 0,
        this.elevation = 1,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(outerPadding),
      child: Card(
        color: backgroundColor,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
//side: BorderSide(color: Colors.grey, width: 0.5)
        ),
        elevation: elevation,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(innerPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}
