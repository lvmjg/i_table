import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';

class SimpleButton extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback? onPressed;
  final double? padding;

  const SimpleButton(
      {Key? key,
      required this.title,
      this.iconData,
      this.iconColor = Colors.black38,
        this.iconSize = 10,
      this.padding = 4,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(title),
          const SizedBox(
            width: 4,
          ),
          if (iconData != null) Icon(iconData, color: iconColor, size: iconSize)
        ],
      ),
    );
  }
}
