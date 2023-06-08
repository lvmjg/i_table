import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/util/globals.dart';

class RestaurantPlanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RestaurantPlanAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
      SystemUiOverlayStyle(statusBarColor: Color(primary)),
      shape: roundedRectangleBorder,
      flexibleSpace:
      Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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