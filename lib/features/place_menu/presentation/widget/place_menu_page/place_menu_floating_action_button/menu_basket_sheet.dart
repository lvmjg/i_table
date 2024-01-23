import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/menu_card_button.dart';
import 'package:i_table/core/widget/menu_card_buttons.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/util/string_util.dart';
import '../../../../../../core/widget/common_card.dart';
import '../../../../../../core/widget/simple_filled_tonal_button.dart';
import '../../../../domain/entity/place_menu_item.dart';
import '../../../bloc/place_menu_bloc.dart';

class MenuBasketSheet extends StatelessWidget {
  MenuBasketSheet({super.key});

  List<PlaceMenuItem> activeBasket = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceMenuBloc, PlaceMenuState>(
        builder: (context, setState) {
      activeBasket =
          setState is PlaceMenuFetchSuccess ? setState.basket : activeBasket;

      String basketTotal =
          setState is PlaceMenuFetchSuccess ? setState.basketTotal : '0.00';

      return Wrap(
        children: [
          CommonCard(
              outerPadding: EdgeInsets.all(1),
              innerPadding: EdgeInsets.all(padding),
              child: Column(children: [
                Text(basket, style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: padding),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: activeBasket.length,
                    itemBuilder: (context, index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        Expanded(
                          flex: 1,
                          child: Text((index + 1).toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: primaryColor)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Wrap(direction: Axis.vertical, children: [
                            Text(activeBasket[index].name,
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            Offstage(
                              offstage:
                                  activeBasket[index].note == StringUtil.EMPTY,
                              child: Wrap(direction: Axis.vertical, children: [
                                SizedBox(height: padding / 4),
                                RichText(
                                  text: TextSpan(
                                    text: '$note ',
                                    children: <InlineSpan>[
                                      TextSpan(
                                          text: activeBasket[index].note,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(color: Colors.red)),
                                    ],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                  ),
                                )
                              ]),
                            ),
                          ]),
                        ),
                        SizedBox(
                            height: 30,
                            width: 90,
                            child: MenuCardButtons(
                                placeMenuItem: activeBasket[index])),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${(activeBasket[index].quantity * activeBasket[index].price)} zł',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: MenuCardButton(
                            onTap: () {
                              context.read<PlaceMenuBloc>().add(
                                  PlaceMenuItemRemoved(
                                      menuItemCategory:
                                          activeBasket[index].category,
                                      menuItemId: activeBasket[index].id));
                            },
                            iconData: Icons.delete_rounded,
                          ),
                        )
                      ]);
                    }),
                SizedBox(height: padding),
                Row(
                  children: [
                    Expanded(
                        child: Wrap(
                      children: [
                        Text('$total ',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('$basketTotal zł',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    )),
                    SimpleFilledTonalButton(
                        title: pay,
                        iconData: Icons.payments_rounded,
                        iconColor: Colors.green,
                        onPressed: () {
                          context
                              .read<PlaceMenuBloc>()
                              .add(PlaceMenuPayLaterChosen());
                        })
                  ],
                ),
              ])),
        ],
      );
    });
  }
}
