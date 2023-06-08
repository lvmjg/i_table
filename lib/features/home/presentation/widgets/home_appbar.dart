import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/util/globals.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
      SystemUiOverlayStyle(statusBarColor: Colors.white),
      shape: roundedRectangleBorder,
      foregroundColor: Color(primary),
      backgroundColor: Colors.white,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      flexibleSpace:
      Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: EdgeInsets.all(padding/2),
          child: Text(
            'iTable',
            style: TextStyle(
                fontSize: 14,
                color: Color(primary),
                fontWeight: FontWeight.w900),
          ),
        ),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}