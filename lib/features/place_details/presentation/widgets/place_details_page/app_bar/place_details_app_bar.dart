import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/util/globals.dart';

class PlaceDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PlaceDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: roundedRectangleBorder,
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      backgroundColor: Color(primary),
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      flexibleSpace:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: EdgeInsets.all(padding / 2),
          child: Text(
            appName,
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
