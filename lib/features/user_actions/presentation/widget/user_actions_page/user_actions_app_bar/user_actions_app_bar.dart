import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';

class UserActionsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> categories;

  const UserActionsAppBar(
      {super.key, required this.title, required this.categories});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: toolbarHeight,
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: TabBar(
            tabAlignment: TabAlignment.center,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.white,
              isScrollable: false,
              tabs: [
                for (final c in categories) Tab(text: c),
              ]),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
