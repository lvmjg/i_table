import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/menu_card.dart';
import 'package:i_table/core/widget/material_text_field_extended.dart';
import 'package:i_table/features/place_menu/presentation/bloc/place_menu_bloc.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/size_helper.dart';
import '../../../../../../core/widget/simple_filled_tonal_button.dart';
import '../../../../domain/entity/place_menu_item.dart';

class MenuItemDetailsSheet extends StatelessWidget {
  final PlaceMenuItem placeMenuItem;
  final bool buttonsEnabled;

  const MenuItemDetailsSheet({super.key, required this.placeMenuItem, required this.buttonsEnabled});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [

         MenuCard(
                placeMenuItem: placeMenuItem,
                imageSize: MediaQuery.of(context).size.width / 2,
                buttonsEnabled: buttonsEnabled,
                modeExtended: true),
        Padding(
          padding: EdgeInsets.all(padding / 2),
          child: FloatingActionButton(
              child: Icon(Icons.close_rounded, color: Colors.white),
              onPressed: () => Navigator.of(context).pop()),
        )
      ],
    );
  }
}
