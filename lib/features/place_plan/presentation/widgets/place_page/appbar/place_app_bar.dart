import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/util/globals.dart';

class PlaceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlaceAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      shape: roundedRectangleBorder,
      flexibleSpace:
      Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            appName,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w900),
          ),
        ),
      ]),
      backgroundColor: Color(primary),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}