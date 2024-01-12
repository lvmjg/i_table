import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/size_helper.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/core/widget/common_card.dart';
import 'package:i_table/core/widget/common_text_field.dart';
import 'package:i_table/core/widget/material_text_field_extended.dart';
import 'package:i_table/core/widget/text_field_extended.dart';

import '../../features/place_menu/domain/entity/place_menu_item.dart';
import '../../features/place_menu/presentation/bloc/place_menu_bloc.dart';
import '../util/globals.dart';
import 'menu_card_buttons.dart';

class MenuCard extends StatelessWidget {
  final PlaceMenuItem placeMenuItem;
  final bool modeExtended;
  final VoidCallback? onPressed;
  final double imageSize;

  MenuCard(
      {Key? key,
      required this.placeMenuItem,
      this.modeExtended = false,
      this.onPressed,
      required this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: onPressed,
        outerPadding: padding / 8,
        innerPadding: padding / 3,
        child: Column(
          children: [
            Row(

              children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Text(placeMenuItem.name,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(height: padding / 2),
                      Text(placeMenuItem.description,
                          style: Theme.of(context).textTheme.bodySmall),
                      SizedBox(height: padding / 2),
                      Text('${placeMenuItem.formattedPrice} zł',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: primaryColor)),
                          SizedBox(height: modeExtended ? padding / 2 : 0),
                          Visibility(
                              visible: modeExtended == true,
                              child: SizedBox(
                                  width: imageSize,
                                  height: imageSize / 3,
                                  child: BlocBuilder<PlaceMenuBloc, PlaceMenuState>(
  builder: (context, state) {
    return MenuCardButtons(
                                      modeExtended: modeExtended,
                                      placeMenuItem: placeMenuItem);
  },
)))
                    ])),
                Column(children: [
                  CommonCard(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Visibility(
                          //  visible: placeMenuItem.url != null,
                          child: SizedBox(
                            width: imageSize,
                            height: imageSize,
                            child: Padding(
                              padding: EdgeInsets.all(padding / 4),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Image.network(placeMenuItem.url ??
                                    'https://thekebabshop.com/wp-content/uploads/2023/04/Web-Wrap.png'),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: modeExtended == false,
                            child: SizedBox(
                                width: imageSize,
                                height: imageSize / 3,
                                child: MenuCardButtons(
                                    placeMenuItem: placeMenuItem)))
                      ],
                    ),
                  ),
                ])
              ],
            ),


          ],
        ));
  }
}
