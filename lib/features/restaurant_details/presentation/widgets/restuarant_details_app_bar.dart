import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/util/globals.dart';

class RestaurantDetailsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RestaurantDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: roundedRectangleBorder,
      systemOverlayStyle:
      SystemUiOverlayStyle(statusBarColor: Color(primary)),
      backgroundColor: Color(primary),
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      flexibleSpace:
      Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: EdgeInsets.all(padding / 2),
          child: Text(
            'iTable',
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