import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/util/globals.dart';
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

      return Wrap(
        children: [
          Padding(
            padding: EdgeInsets.all(padding / 8),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: activeBasket.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(activeBasket[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white)),
                    subtitle: Text(activeBasket[index].description,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.white70)),
                    trailing: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              context.read<PlaceMenuBloc>().add(
                                  PlaceMenuItemSubstracted(
                                      menuItemCategory:
                                          activeBasket[index].category,
                                      menuItemId: activeBasket[index].id));
                            },
                          ),
                        ),
                        //SizedBox(width: padding/4),
                        Text(
                          activeBasket[index].quantity.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        //SizedBox(width: padding/4),
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_circle_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              context.read<PlaceMenuBloc>().add(
                                  PlaceMenuItemAdded(
                                      menuItemCategory:
                                          activeBasket[index].category,
                                      menuItemId: activeBasket[index].id));
                            },
                          ),
                        ),
                        Text(
                          '${(activeBasket[index].quantity * activeBasket[index].price)} zł',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              context.read<PlaceMenuBloc>().add(
                                  PlaceMenuItemRemoved(
                                      menuItemCategory:
                                          activeBasket[index].category,
                                      menuItemId: activeBasket[index].id));
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SimpleFilledTonalButton(
                  title: payLater,
                  iconData: Icons.watch_later_rounded,
                  iconColor: Colors.red,
                  onPressed: () {
                    context
                        .read<PlaceMenuBloc>()
                        .add(PlaceMenuPayLaterChosen());
                  }),
              SimpleFilledTonalButton(
                  title: payNow,
                  iconData: Icons.payments_rounded,
                  iconColor: Colors.green,
                  onPressed: () {
                    //context.read<ReservationSummaryBloc>().add(ReservationSummarySubmitted());
                  })
            ],
          ),
        ],
      );
    });
  }
}
