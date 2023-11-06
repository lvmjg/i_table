import 'package:flutter/material.dart';

import '../util/globals.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(
            child: CircularProgressIndicator(
                color: primaryColor
            )
        )
    );
  }
}
