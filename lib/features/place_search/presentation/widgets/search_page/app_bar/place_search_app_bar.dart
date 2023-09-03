import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/util/globals.dart';

class PlaceSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlaceSearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      flexibleSpace:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: EdgeInsets.all(padding / 2),
          child: Text(
            appName,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w900),
          ),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
