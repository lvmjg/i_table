import 'package:flutter/material.dart';

import '../util/globals.dart';

class ReservationCardEmpty extends StatelessWidget {

  final Widget child;

  const ReservationCardEmpty({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(padding/2),
        child: child,
      ),
    );
  }
}
