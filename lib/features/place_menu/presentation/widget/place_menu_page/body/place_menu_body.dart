import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/core/widget/common_loading.dart';
import 'package:i_table/core/widget/menu_card.dart';
import 'package:i_table/core/widget/text_field_extended.dart';

import '../../../../../../core/util/size_helper.dart';
import '../../../bloc/place_menu_bloc.dart';
import '../place_menu_floating_action_button/menu_item_details_sheet.dart';

class PlaceMenuBody extends StatefulWidget {
  const PlaceMenuBody({
    super.key,
  });

  @override
  State<PlaceMenuBody> createState() => _PlaceMenuBodyState();
}

class _PlaceMenuBodyState extends State<PlaceMenuBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceMenuBloc, PlaceMenuState>(
      builder: (context, state) {
        if (state is PlaceMenuFetchSuccess) {
          return TabBarView(
            children: [
              for (final c in state.placeMenu.placeMenuCategories)
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: c.items.length,
                          itemBuilder: (context, index) {
                            return MenuCard(
                                placeMenuItem: c.items[index],
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                      context: context,
                                      backgroundColor: primaryColor,
                                      builder: (context) {
                                        return Container(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                                              child: MenuItemDetailsSheet(
                                                  placeMenuItem: c.items[index],
                                              )),
                                        );
                                      });
                                }, imageSize: SizeHelper.getHighestSize(context)/8);
                          }),
                    ),
                  ],
                )
            ],
          );
        }
        return CommonLoading();
      },
    );
  }
}
