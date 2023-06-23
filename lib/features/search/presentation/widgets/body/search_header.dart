import 'package:flutter/material.dart';

import '../../../../../core/util/globals.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(chooseRestaurant,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300)),
    );
  }
}