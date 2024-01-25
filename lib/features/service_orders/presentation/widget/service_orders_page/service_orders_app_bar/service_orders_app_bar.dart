import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';

class ServiceOrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> categories;

  const ServiceOrdersAppBar(
      {super.key, required this.title, required this.categories});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: toolbarHeight,
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding*2),
            child: TabBar(
                tabAlignment: TabAlignment.center,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                indicatorColor: Colors.white,
                labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
                isScrollable: true,
                tabs: [
                  for (final c in categories) Tab(text: c),
                ]),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}