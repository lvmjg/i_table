import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';

class SimpleOutlinedButton extends StatelessWidget {
  final String title;
  final double padding;
  final VoidCallback onPressed;

  const SimpleOutlinedButton(
      {Key? key, required this.title, this.padding = 2, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(title),
      ),
    );
  }
}
