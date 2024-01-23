import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:i_table/core/widget/menu_card.dart';
import 'package:i_table/core/widget/material_text_field_extended.dart';
import 'package:i_table/features/place_menu/presentation/bloc/place_menu_bloc.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/size_helper.dart';
import '../../../../../../core/util/string_util.dart';
import '../../../../../../core/widget/common_text_field.dart';
import '../../../../../../core/widget/menu_card_buttons.dart';
import '../../../../../../core/widget/simple_filled_tonal_button.dart';
import '../../../../domain/entity/place_menu_item.dart';

class MenuItemDetailsSheet extends StatelessWidget {
  final PlaceMenuItem placeMenuItem;

  const MenuItemDetailsSheet({super.key, required this.placeMenuItem});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CommonCard(
            outerPadding: EdgeInsets.all(1),
            innerPadding: EdgeInsets.all(padding),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.network(placeMenuItem.url ?? StringUtil.EMPTY),
                ),
                SizedBox(height: padding / 2),
                Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(placeMenuItem.name,
                                  textAlign: TextAlign.left,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              SizedBox(height: padding / 2),
                              Text(placeMenuItem.description,
                                  style: Theme.of(context).textTheme.bodySmall),
                              SizedBox(height: padding / 2),
                              Text('${placeMenuItem.formattedPrice} zł',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: primaryColor)),
                            ])),
                    Expanded(
                        flex: 3,
                        child: Column(children: [
                          SizedBox(
                              width: 100,
                              height: 100 / 3,
                              child: BlocBuilder<PlaceMenuBloc, PlaceMenuState>(
                                builder: (context, state) {
                                  return MenuCardButtons(
                                      modeExtended: true,
                                      placeMenuItem: placeMenuItem);
                                },
                              ))
                        ]))
                  ],
                ),
                SizedBox(height: padding / 2),
                Row(
                  children: [
                    Expanded(
                      child: CommonTextField(
                        text: placeMenuItem.note,
                        hintText: orderNotes,
                        iconAction: Icons.clear_rounded,
                        onTextChanged: (value) {
                          placeMenuItem.note = value;
                        },
                        onActionIconPressed: () {
                          placeMenuItem.note = StringUtil.EMPTY;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
