import 'package:flutter/material.dart';

import '../../../../../core/util/globals.dart';

class RestaurantLogo extends StatelessWidget {
  const RestaurantLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Image.asset('assets/logo.png'),
    );
  }
}
