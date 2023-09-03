import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';

class SimpleFilledTonalButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SimpleFilledTonalButton(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(title),
      ),
    );
  }
}
