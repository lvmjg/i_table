import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';
import 'package:i_table/features/place_menu/domain/entity/place_menu_item.dart';
import 'package:i_table/features/place_menu/presentation/bloc/place_menu_bloc.dart';

import '../../../../core/util/globals.dart';

class MenuCardButtons extends StatelessWidget {
  final PlaceMenuItem placeMenuItem;

  const MenuCardButtons({Key? key, required this.placeMenuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SimpleFilledTonalButton(
              title: '-',
              onPressed: () {
                context.read<PlaceMenuBloc>().add(PlaceMenuItemSubtracted(
                    menuItemCategory: placeMenuItem.category,
                    menuItemId: placeMenuItem.id));
              }),
          SizedBox(width: padding),
          Text(
            placeMenuItem.quantity.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(width: padding),
          SimpleFilledTonalButton(
              title: '+',
              onPressed: () {
                context.read<PlaceMenuBloc>().add(PlaceMenuItemAdded(
                    menuItemCategory: placeMenuItem.category,
                    menuItemId: placeMenuItem.id));
              }),
        ],
      ),
    );
  }
}
