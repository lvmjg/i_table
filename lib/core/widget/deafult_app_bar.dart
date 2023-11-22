import 'package:flutter/material.dart';

import '../util/globals.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: roundedRectangleBorder,
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      backgroundColor: primaryColor,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      flexibleSpace:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: EdgeInsets.all(padding / 4 * 3),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.6),
          ),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
