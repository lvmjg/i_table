import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';

class SimpleButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;

  const SimpleButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(primary),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)))),
        onPressed: onPressed,
        child: Text(title));
  }
}
