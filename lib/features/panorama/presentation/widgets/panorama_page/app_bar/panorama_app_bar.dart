import 'package:flutter/material.dart';

import '../../../../../place/presentation/widgets/place_page/appbar/place_app_bar.dart';


class PanoramaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PanoramaAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlaceAppBar();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
