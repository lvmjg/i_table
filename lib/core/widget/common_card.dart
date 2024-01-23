import 'package:flutter/material.dart';

import '../util/globals.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  late EdgeInsets outerPadding;
  late EdgeInsets innerPadding;
  late double elevation;
  late Color? backgroundColor;

  CommonCard(
      {Key? key,
      required this.child,
      this.onPressed,
      this.outerPadding = EdgeInsets.zero,
        this.innerPadding = EdgeInsets.zero,
        this.elevation = 1,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
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
            padding: innerPadding,
            child: child,
          ),
        ),
      ),
    );
  }
}
