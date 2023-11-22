import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/core/widget/simple_button.dart';

class SimpleFilledTonalButton extends SimpleButton {
  const SimpleFilledTonalButton(
      {Key? key,
      required String title,
      IconData? iconData,
      Color? iconColor,
      double? padding,
      VoidCallback? onPressed})
      : super(
            key: key,
            title: title,
            iconData: iconData,
            iconColor: iconColor,
            padding: padding,
            onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
        onPressed: onPressed, child: super.build(context));
  }
}
