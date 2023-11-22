import 'package:flutter/material.dart';

import '../util/globals.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  late double outerPadding;
  late Color? backgroundColor;

  CommonCard(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.outerPadding = 0,
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
        elevation: 1,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(padding / 2),
            child: child,
          ),
        ),
      ),
    );
  }
}
