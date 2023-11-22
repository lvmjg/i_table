import 'package:flutter/material.dart';

import '../util/globals.dart';

class CommonLoading extends StatelessWidget {
  final Color color;

  const CommonLoading({Key? key, this.color = primaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Center(child: CircularProgressIndicator(color: color)));
  }
}
