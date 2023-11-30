import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/simple_filled_tonal_button.dart';
import 'package:i_table/features/place_menu/domain/entity/place_menu_item.dart';
import 'package:i_table/features/place_menu/presentation/bloc/place_menu_bloc.dart';

import '../../../../core/util/globals.dart';
import '../util/size_helper.dart';

class MenuCardButtons extends StatelessWidget {
  final PlaceMenuItem placeMenuItem;
  final bool modeExtended;

  const MenuCardButtons({Key? key, required this.placeMenuItem, this.modeExtended = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: modeExtended ? 1 : 0.6,
      child: Padding(
        padding: EdgeInsets.all(modeExtended ? padding/2 : 0),
        child: Row(
           // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

            Expanded(
              flex: 1,
              child: Visibility(
                visible: placeMenuItem.quantity !=0 || modeExtended,
                child: Container(
                  height: double.infinity,
                  child: InkWell(
                    onTap: () {
                      context.read<PlaceMenuBloc>().add(PlaceMenuItemSubtracted(
                          menuItemCategory: placeMenuItem.category,
                          menuItemId: placeMenuItem.id));
                    },
                    child: Icon(
                      Icons.remove_circle_outline_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                    )
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Visibility(
                  visible: placeMenuItem.quantity!=0 || modeExtended,
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
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: InkWell(
                    onTap: () {
                      context.read<PlaceMenuBloc>().add(PlaceMenuItemAdded(
                          menuItemCategory: placeMenuItem.category,
                          menuItemId: placeMenuItem.id));
                    },
                    child: Icon(
                      Icons.add_circle_outline_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      )
                  ),
                )),
          ]),
      ),
    );
  }
}
