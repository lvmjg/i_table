import 'package:flutter/material.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';

import '../util/globals.dart';

class CommonFailure extends StatelessWidget {
  final VoidCallback onPressed;

  const CommonFailure({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorFetchData,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: padding,
          ),
          SimpleFilledTonalButton(title: tryAgain, onPressed: onPressed)
        ],
      ),
    );
  }
}
