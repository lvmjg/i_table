import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/features/place_menu/presentation/widget/place_menu_page/place_menu_floating_action_button/menu_basket_sheet.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/simple_filled_tonal_button.dart';
import '../../../bloc/place_menu_bloc.dart';

class PlaceMenuFloatingActionButton extends StatelessWidget {
  const PlaceMenuFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceMenuBloc, PlaceMenuState>(
      builder: (context, state) {
        String basketTotal = state is PlaceMenuFetchSuccess
            ? state.basketTotal
            : StringUtil.EMPTY;

        int basketTotalItems = state is PlaceMenuFetchSuccess ? state.basketTotalItems : 0;

        return Opacity(
          opacity: basketTotal != StringUtil.EMPTY ? 1.0 : 0.75,
          child: FloatingActionButton.extended(

              onPressed: _controlBasketButton(context, basketTotal),
              icon:   Icon(
                  Icons.shopping_basket_rounded,
                  color: Colors.white),
              label: Row(
                children: [
                  Text('$showBasket ',
                      style: TextStyle(color: Colors.white)),
                  Text(_displayBasketTotal(basketTotal),
                      style: TextStyle(color: Colors.white)),
                  Text(_displayBasketItems(basketTotalItems),
                      style: TextStyle(color: Colors.white)),
                ],
              ),
          ),
        );
      },
    );
  }

  VoidCallback? _controlBasketButton(BuildContext context, String basketTotal) {
    if (basketTotal == StringUtil.EMPTY) {
      return null;
    } else {
      return () {
        showModalBottomSheet(
            context: context,
            backgroundColor: primaryColor,
            builder: (context) {
              return MenuBasketSheet();
            });
      };
    }
  }

  String _displayBasketItems(int basketTotalItems){
    if(basketTotalItems==0){
      return StringUtil.EMPTY;
    }

    return '($basketTotalItems)';
  }

  String _displayBasketTotal(String basketTotal){
    if(basketTotal!=StringUtil.EMPTY){
      return '$basketTotal zł ';
    }

    return StringUtil.EMPTY;
  }
}
