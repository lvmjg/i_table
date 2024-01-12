import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/menu_card_button.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';
import 'package:i_table/features/place_menu/domain/entity/place_menu_item.dart';
import 'package:i_table/features/place_menu/presentation/bloc/place_menu_bloc.dart';

import '../../../../core/util/globals.dart';
import '../util/size_helper.dart';

class MenuCardButtons extends StatelessWidget {
  final PlaceMenuItem placeMenuItem;
  final bool modeExtended;

  const MenuCardButtons(
      {Key? key, required this.placeMenuItem, this.modeExtended = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: modeExtended ? 1 : 0.8,
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Visibility(
              visible: placeMenuItem.quantity != 0 || modeExtended,
              child: MenuCardButton(
                type: MenuCardButtonType.left,
                onTap: () {
                  context.read<PlaceMenuBloc>().add(PlaceMenuItemSubtracted(
                      menuItemCategory: placeMenuItem.category,
                      menuItemId: placeMenuItem.id));
                },
                iconData: Icons.remove_circle_outline_rounded,
              )),
        ),
        Expanded(
            flex: 1,
            child: Visibility(
              visible: placeMenuItem.quantity != 0 || modeExtended,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.grey,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    placeMenuItem.quantity.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: MenuCardButton(
              type: MenuCardButtonType.right,
              onTap: () {
                context.read<PlaceMenuBloc>().add(PlaceMenuItemAdded(
                    menuItemCategory: placeMenuItem.category,
                    menuItemId: placeMenuItem.id));
              },
              iconData: Icons.add_circle_outline_rounded,
            )),
      ]),
    );
  }
}
