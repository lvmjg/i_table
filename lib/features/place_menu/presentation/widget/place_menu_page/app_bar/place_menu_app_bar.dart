import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/place_menu/presentation/bloc/place_menu_bloc.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/common_loading.dart';
import '../../../../domain/entity/place_menu_category.dart';

class PlaceMenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<PlaceMenuCategory> placeMenuCategories;

  PlaceMenuAppBar({
    super.key,
    required this.title,
    required this.placeMenuCategories,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: toolbarHeight * 2,
        flexibleSpace:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: EdgeInsets.all(padding / 2),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
          BlocBuilder<PlaceMenuBloc, PlaceMenuState>(builder: (context, state) {
            if (state is PlaceMenuFetchSuccess) {
              return TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: [
                  for (final c in placeMenuCategories) Tab(text: c.name),
                ],
              );
            }

            return TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: [Tab(text: '...')],
            );
          })
        ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}
